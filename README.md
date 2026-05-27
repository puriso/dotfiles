# dotfiles

このリポジトリは、zsh / vim / tmux / git / starship の個人設定をまとめた `dotfiles` です。

## 対応環境

- macOS（Homebrew 利用を想定）
- zsh
- tmux
- Vim / MacVim

## 含まれている主な設定

- `.zshrc`（エイリアス、各種 PATH、Starship 初期化など）
- `.vimrc`（基本設定、dein.vim によるプラグイン管理）
- `.dein.toml` / `.dein_lazy.toml`（Vim プラグイン定義）
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
ln -sf ~/git/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/git/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml
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

### 5. Vim プラグインの初期導入

この `.vimrc` は、初回起動時に `dein.vim` を自動インストールする設定になっています。

- Vim 起動後にプラグイン導入処理が走ります。
- Python/Ruby 系補完を使う場合は、必要な言語ランタイムやツール（例: `solargraph`）を別途インストールしてください。

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
