# dotfiles

このリポジトリは、zsh / vim / tmux / git / starship の個人設定をまとめた `dotfiles` です。

## 対応環境

- macOS（Homebrew 利用を想定）
- zsh
- tmux
- Vim / MacVim

## 含まれている主な設定

- `.zshrc`（エイリアス、各種 PATH、Starship 初期化など）
- `.vimrc`（基本設定、標準機能中心の構成）
- `.tmux.conf`（キーバインド、TPM プラグイン設定）
- `.starship.toml`（プロンプト表示設定）
- `.gitconfig`（Git エイリアス）

## セットアップ手順

### 1. 依存ツールのインストール

```bash
brew update
brew install zsh tmux starship colordiff rmtrash
```

必要に応じて、MacVim もインストールしてください。

- https://github.com/macvim-dev/macvim/releases

### 2. リポジトリを clone

```bash
git clone https://github.com/puriso/dotfiles.git ~/git/dotfiles
```

### 3. 各設定ファイルをシンボリックリンク

```bash
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.zshrc ~/.zshrc
ln -sf ~/git/dotfiles/.starship.toml ~/.starship.toml
ln -sf ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/git/dotfiles/.gitconfig ~/.gitconfig
```

### 4. tmux プラグインマネージャ（TPM）の導入

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

tmux 起動後に `prefix + I` でプラグインをインストールしてください。

### 5. Vim の補完/LSP/lint/検索の方針

この設定は Vim 側のプラグイン管理を行わず、補完・LSP・lint・検索は VS Code / Cursor / CLI / プロジェクト側の仕組みに寄せる方針です。

- Vim は編集のための基本機能と配色に絞っています。
- 言語機能が必要な場合は、各プロジェクトが提供する公式ツール（例: `npm scripts`, `make`, `ruff`, `biome`, `eslint` など）を利用してください。

## 補足

### デフォルトシェルを zsh に変更する場合

```bash
chsh -s "$(command -v zsh)"
```

変更後はターミナルを再起動してください。

### MacVim 連携

`.zshrc` では MacVim バイナリが存在する場合、`vi` / `vim` エイリアスを MacVim に向ける設定があります。

## 注意点

- 本設定は個人用途ベースのため、環境によっては PATH や言語ランタイム設定の調整が必要です。
- 既存の設定ファイルを上書きする前にバックアップを取ることを推奨します。
