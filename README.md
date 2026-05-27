# dotfiles

このリポジトリは、zsh / vim / tmux / git / starship の個人設定をまとめた `dotfiles` です。

## 対応環境

- macOS / Linux
- zsh
- tmux
- Vim

## 含まれている主な設定

- `.zshrc`（エイリアス、各種 PATH、Starship 初期化など）
- `.vimrc`（プラグインなし最小構成 + `dark2026` テーマ読込）
- `colors/dark2026.vim`（Vim カラースキーマ）
- `.tmux.conf`（キーバインド、TPM プラグイン設定）
- `.starship.toml`（プロンプト表示設定）
- `.gitconfig`（Git エイリアス）

## セットアップ手順

### 1. 依存ツールのインストール

```bash
# macOS (Homebrew)
brew update
brew install zsh tmux starship colordiff rmtrash

# Ubuntu / Debian 系（例）
sudo apt update
sudo apt install -y zsh tmux git vim
```

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

### 4. Vim テーマ `dark2026` を配置

このリポジトリ同梱の `colors/dark2026.vim` は、`.vimrc` をこのリポジトリから読み込む場合は自動で参照されます。

`~/.vim/colors/` に配置して使いたい場合は、以下を実行してください。

```bash
mkdir -p ~/.vim/colors
cp ~/git/dotfiles/colors/dark2026.vim ~/.vim/colors/dark2026.vim
```

`.vimrc` は次の優先順位で `colorscheme dark2026` を適用します。

1. `~/.vim/colors/dark2026.vim`
2. このリポジトリ内の `colors/dark2026.vim`（`.vimrc` と同じディレクトリ配下）

どちらも見つからない場合はテーマ適用をスキップするため、Vim 起動は継続します。

### 5. tmux プラグインマネージャ（TPM）の導入

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

tmux 起動後に `prefix + I` でプラグインをインストールしてください。



### dark2026 公式テーマについて

- 公式リポジトリ: https://github.com/D0nw0r/dark2026.nvim
- この dotfiles では Vim 互換のため `colors/dark2026.vim` を同梱しています。
- Neovim 側で公式テーマをそのまま使う場合は、上記リポジトリの手順に従って導入してください。

## Vim の方針

- プラグインマネージャ（dein.vim）は使用しません。
- Vim はプラグインなしの最小構成で起動します。
- 見た目は `dark2026` テーマで統一します（テーマファイル配置時）。

## 補足

### デフォルトシェルを zsh に変更する場合

```bash
chsh -s "$(command -v zsh)"
```

変更後はターミナルを再起動してください。

## 注意点

- 本設定は個人用途ベースのため、環境によっては PATH や言語ランタイム設定の調整が必要です。
- 既存の設定ファイルを上書きする前にバックアップを取ることを推奨します。
