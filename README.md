# AtCoder with Rust in mac

[cargo atcoder](https://github.com/tanakh/cargo-atcoder)を使用させていただいています。

## セットアップ

まずこのリポジトリをcloneします。
AtCoder用の環境を作りたい場所で、以下のコマンドを実行してください。

```bash
git clone https://github.com/hppRC/AtCoder-with-Rust-in-mac.git
```

次に、クローンしてきた場所に移動します。

```bash
# どこかのディレクトリからAtCoder用のディレクトリへ
cd AtCoder-with-Rust-in-mac
```

次に、セットアップ用のスクリプトを実行します。
これを実行すると、Rust本体のインストールし、AtCoder用のconfigファイルのシンボリックリンクを貼り、brewで必要なパッケージをインストールします。
もしすでにインストール済みならインストールを行わないように処理を書いていますが、気になるようであれば`init.sh`を読んでみてください。めっちゃ単純です。

```bash
bash ./init.sh
```

これで環境は整ったはずです。
早速提出してみましょう！

## 基本操作


### 解法を投げる

```bash
cargo atcoder submit <problem-id>
```

### バイナリで投げる(デフォルトはこっちにしてあります)

```bash
cargo atcoder submit --bin <problem-id>
```

#### 便利なやつ

```bash
alias cas="cargo atcoder submit"
```

これで例えばabc152ディレクトリに移動して

```bash
cas a
```
と打てば提出できる


### 提出状況確認

```bash
cargo atcoder status
```

### 便利alias群

既存のエイリアスやコマンドとかぶらないようにしてお使いください。

```bash
alias cas="cargo atcoder submit"
alias can="cargo atcoder new"
```


### cargo-atcoder.tomlをGit管理

tomlファイルもgit管理したいのは非常に常識的な感覚だと思うので、シンボリックリンクの貼り方も載せておきます。
シンボリックリンクは(誤解を恐れずに言うと)ファイルのドッペルゲンガーを作るようなコマンドで、一方で編集した内容がもう一方にも反映させることができます。  

**macOS環境を想定**

```
# ln -sf ~/path/to/your_directory/cargo-atcoder.toml ~/Library/Preferences/
# 現在いるディレクトリのcargo-atcoder.toml から ~/Library/Preferences/ へ貼るには以下

ln -sf $(pwd)/cargo-atcoder.toml ~/Library/Preferences/
```