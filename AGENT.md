# AGENT.md

このドキュメントは、このリポジトリを AI agent / Codex で安全に保守するための作業ルールを定義します。

> **メモ（自分向け）**
> この AGENT.md は LLM により自動生成された内容を含むため、精度が低い可能性があります。必要に応じて必ず人間が見直してください。

## 1. このリポジトリの方針

- このリポジトリは、個人開発環境用の dotfiles です。
- 便利さよりも、壊れにくさ・復旧しやすさ・不要技術を増やさないことを優先します。
- `zsh` / `tmux` / `git` / `vim` が最低限壊れずに動く状態を維持します。
- OS / CPU / 端末固有の固定PATHをできるだけ避けます。
- プロジェクト固有の lint / formatter / language runtime 設定をグローバル dotfiles に持ち込まないでください。

## 2. AI agent が守るべきルール

- 大きすぎる変更を避け、小さなPRに分けてください。
- 挙動変更がある場合は、PR概要に明記してください。
- 任意コマンドは `command -v` で存在確認してから初期化してください。
- 存在しないコマンドによって `.zshrc` 読み込みが失敗しないようにしてください。
- secret / token / credential を出力・保存・コミットしないでください。
- credentialらしき値を見つけた場合は `<REDACTED>` として扱ってください。
- `tmux` / `git` / `vim` の既存挙動を不用意に壊さないでください。
- 古い技術は復旧より削除・隔離を優先してください。

## 3. 固定PATHを避けるルール

以下のような固定PATHは避けてください。

```sh
/usr/local/bin/zsh
/usr/local/Caskroom
/opt/local/bin
/home/jenkins/android-sdk-linux
/Library/Frameworks/Python.framework/Versions/3.8/bin
```
