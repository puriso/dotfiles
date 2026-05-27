# dotfiles

zsh / Vim / tmux / git / starship の個人設定を、**最小コストで再現できる形**にまとめた `dotfiles` です。  
「すぐ使える」「壊れにくい」「移行しやすい」を重視しています。

---

## 対応環境

- macOS
- zsh
- tmux
- Vim / MacVim

---

## 含まれている主な設定

- `.zshrc`
- `.vimrc`
- `.tmux.conf`
- `.starship.toml`
- `.gitconfig`

---

## セットアップ

### 1) 依存ツールをインストール

```bash
brew update
brew install zsh tmux starship colordiff rmtrash
```

必要に応じて MacVim も導入してください。

- https://github.com/macvim-dev/macvim/releases

### 2) リポジトリを clone

```bash
git clone https://github.com/puriso/dotfiles.git ~/git/dotfiles
```

### 3) 設定ファイルをシンボリックリンク

```bash
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.zshrc ~/.zshrc
ln -sf ~/git/dotfiles/.starship.toml ~/.starship.toml
ln -sf ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/git/dotfiles/.gitconfig ~/.gitconfig
```

### 4) tmux Plugin Manager (TPM) を導入

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

tmux 起動後に `prefix + I` でプラグインをインストールしてください。

---

## 設計方針

### Vim の補完 / LSP / lint / 検索

この設定では Vim 側で過剰なプラグイン管理を行わず、補完・LSP・lint・検索は **VS Code / Cursor / CLI / プロジェクト標準ツール** を優先する方針です。

- Vim は編集体験（基本機能・見た目・操作性）に集中
- 言語機能はプロジェクト公式の仕組みを利用

### 言語ランタイム管理（mise）

`.zshrc` は `rbenv` / `nodenv` / `pyenv` / `anyenv` の直接 `eval` 初期化を行わず、`mise` が存在する場合のみ有効化します。

```bash
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
```

- `mise` 未導入でも `.zshrc` 読み込みでエラーにならない
- 既存の `rbenv` / `nodenv` / `pyenv` / `anyenv` は段階的な整理を推奨
- `.ruby-version` / `.node-version` / `.python-version` を利用中のプロジェクトは、`mise.toml` への移行または互換設定の確認を推奨

---

## 補足

### デフォルトシェルを zsh に変更

```bash
chsh -s "$(command -v zsh)"
```

実行後はターミナルを再起動してください。

### MacVim 連携

`.zshrc` では MacVim バイナリが存在する場合、`vi` / `vim` エイリアスを MacVim に向ける設定を含みます。

---

## 注意点

- 個人用途ベースのため、環境に応じて PATH や言語ランタイム設定の調整が必要です
- 既存ファイルを上書きする前に、必ずバックアップを取得してください
