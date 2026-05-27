# AGENT.md

This document defines how AI agents such as Codex, Claude, and ChatGPT should modify this dotfiles repository.

このリポジトリは個人の開発環境を管理するための dotfiles です。  
変更時は「便利さ」よりも「壊れにくさ」「復旧しやすさ」「不要技術を増やさないこと」を優先してください。

## Repository policy

### Goals

- macOS 上で zsh / tmux / git / vim が最低限壊れずに動く状態を保つ
- 古い技術や現在使っていない依存を減らす
- OS / CPU / 端末固有の固定PATHをできるだけ避ける
- プロジェクト固有の設定をグローバル dotfiles に持ち込まない
- AI が変更理由を追いやすい小さな差分にする

### Non-goals

- Vim を IDE として復旧すること
- dein.vim など古いプラグイン管理を復活させること
- すべての開発言語・全プロジェクトの設定を dotfiles に集約すること
- secret / token / credential を探索・表示・保存すること

## Important rules

### 1. Do not hardcode machine-specific paths

Avoid adding paths that only work on one machine or one CPU architecture.

Bad examples:

```sh
/usr/local/bin/zsh
/usr/local/Caskroom
/opt/local/bin
/home/jenkins/android-sdk-linux
/Library/Frameworks/Python.framework/Versions/3.8/bin
```

When Homebrew paths are needed, prefer guarded initialization.

```sh
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
```

### 2. Guard optional commands

Do not call optional commands directly from `.zshrc` unless they are guaranteed to exist.

Use `command -v` guards.

```sh
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

if command -v anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
```

### 3. Prefer removal over restoration for legacy tools

If an old tool is broken and no longer clearly needed, prefer removing or isolating it instead of restoring it.

Legacy removal candidates:

- dein.vim
- `.dein.toml`
- `.dein_lazy.toml`
- `installer.sh` for dein
- MacVim / gVim specific assumptions
- JSHint global config
- phpenv / phpbrew
- hardcoded PHP 7.0 paths
- hardcoded MySQL 5.7 paths
- hardcoded Python 3.8 paths
- anyenv / rbenv / nodenv / pyenv mixed initialization without guards

### 4. Keep Vim minimal

Vim should work as a lightweight editor even when plugins are unavailable.

The default direction is:

- no plugin manager by default
- no dein bootstrap
- no plugin-dependent commands in `.vimrc`
- keep basic editing settings
- allow local colorscheme such as `dark2026` if available
- do not fail startup when a colorscheme is missing

Example:

```vim
syntax on
filetype plugin indent on

if filereadable(expand('~/.vim/colors/dark2026.vim'))
  colorscheme dark2026
endif
```

### 5. Keep tmux simple

`tmux` settings may be kept if they are small and stable.

Allowed examples:

- vi-like copy mode
- pane navigation
- reload keybinding
- mouse support
- simple status line

Avoid adding complex tmux plugin dependencies unless the benefit is clear.

### 6. Keep project-specific linting out of dotfiles

Do not add global lint/formatter settings for specific projects unless there is a strong reason.

Prefer project-local tools:

- ESLint / Biome for JS/TS projects
- RuboCop for Ruby projects
- project `package.json`, `Gemfile`, or repository-specific config

## Change strategy

### Make small changes

Prefer small PRs with one purpose.

Good examples:

- guard missing env manager initialization
- remove dein files and simplify `.vimrc`
- update README installation steps
- simplify tmux status script

Bad examples:

- migrate all shell, editor, tmux, git settings at once
- introduce mise and remove all env managers in the same PR without explaining impact
- rewrite README and change behavior heavily in one diff

### Preserve current behavior when possible

When cleaning up, avoid unnecessary behavior changes.

If behavior changes are intentional, explain them in the PR summary.

## Validation commands

Run relevant checks after changes.

### zsh

```sh
zsh -n ~/.zshrc
source ~/.zshrc
```

If editing the repository file directly:

```sh
zsh -n .zshrc
```

### tmux

```sh
tmux source-file ~/.tmux.conf
```

If editing the repository file directly:

```sh
tmux -f .tmux.conf new-session -d -s dotfiles-check
```

### vim

```sh
vim -Nu ~/.vimrc +q
vim --clean +q
```

If checking a repository-local vimrc:

```sh
vim -Nu .vimrc +q
```

### git

```sh
git diff --check
git status --short
```

## PR summary format

Every PR should include `Why` and `What`.

Use this format:

```md
## Why

- Explain the problem or motivation.
- Mention concrete errors or pain points if available.
- Example: `.zshrc` directly called `rbenv`, `nodenv`, and `anyenv`, causing `command not found` when those tools were not installed.

## What

- Summarize what changed.
- Keep this focused on the actual diff.
- Example: Added `command -v` guards around optional env manager initialization.

## Impact

- Describe expected behavior changes.
- Mention if existing behavior should be preserved.
- Example: zsh startup no longer fails when optional env managers are missing.

## Removed / deprecated

- List removed legacy tools or newly documented removal candidates.
- Example: Marked dein.vim and JSHint as removal candidates.

## Verification

- List commands that were run.

```sh
zsh -n .zshrc
vim -Nu .vimrc +q
git diff --check
```
```

## PR title examples

Use concise titles.

```text
Guard optional env manager initialization
Remove legacy dein-based Vim setup
Simplify Vim configuration
Update dotfiles setup documentation
```

## Security notes

- Never print secret values.
- Never commit private keys, tokens, credentials, or machine-local secrets.
- If a suspicious credential-like value is found, redact it as `<REDACTED>` in explanations.
- Do not add generated dumps, logs, or local machine files unless explicitly needed.

## Preferred direction

The long-term direction is:

- zsh: minimal, guarded, portable
- tmux: simple and stable
- git: small aliases only
- vim: minimal editor with `dark2026` theme if available
- language versions: eventually consider `mise`, but migrate separately and carefully
- lint/format: project-local, not global dotfiles
