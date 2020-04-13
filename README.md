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

ちなみにRustの各種ツールのインストールはちょっと長めです。気長に待ちましょう。自分のmacは火を吹きました。多分普通だと思います。

インストールが終わると**login**を求められるので、AtCoderのユーザー名とパスワードを入力ください。


### Dockerをインストールしていない方へ

クロスコンパイル(コンパイルされる環境と実行環境が違う時にいい感じにコンパイル)するために、crossというツールを使用します。これはDockerを使用するので、Dockerをinstallする必要があります。

こちらの記事\[[DockerをMacにインストールする（更新: 2019/7/13）](https://qiita.com/kurkuru/items/127fa99ef5b2f0288b81)\]に詳しく載っていますが、一応手順をさらっと書いておきます。

Dockerのインストールはやり方を知っていると簡単です。まず[Docker公式サイト](https://hub.docker.com/editions/community/docker-ce-desktop-mac)にアクセスして`create account`してください。Dockerを使うためには~~なぜか~~DockerHubというところのアカウントを作る必要があるので、ここは我慢してください。

適当にインストール手順が出てくると思うので、いい感じにこなすとコマンドラインでdockerが呼べるようになっています。`docker version`を実行してみましょう。

### 長い戦いの果てに

さて、これで環境は整ったはずです。
早速問題を解いて提出してみましょう！

ちなみにですが、Rust何もわからん、という方のための動作確認用に自分のリポジトリへのリンクを貼っておきます。
ご自由にお使いください。

[https://github.com/hppRC/AtCoder](https://github.com/hppRC/AtCoder)


また、cloneしてきたリポジトリを自分のリポジトリとして管理したい！という場合は`git init`なり`rm -rf ./.git`なりして頂いて大丈夫です。こちもご自由にお使いください。

## 基本操作

使用させて頂いている[cargo-atcoder](https://github.com/tanakh/cargo-atcoder)のREADMEに詳しい説明が載っているので、特に書くことはありませんがメモがわりに残しておきます。

また、AtCoderで使えるRustの基本的な情報については、先人の方々が残してくださった記事のリンクを列挙させていただきます。
以下をご参照ください。

- [AtCoderコンテストにRustで参加するためのガイドブック](https://doc.rust-jp.rs/atcoder-rust-resources/introduction.html)
- [AtCoder 2020年言語アップデート以降の環境](https://github.com/rust-lang-ja/atcoder-rust-resources/wiki/2020-Update)
- [AtCoder のジャッジシステムアップデートによって Rust で使えるようになる便利 API たちの紹介](https://qiita.com/maguro_tuna/items/b4472d7497eac57fc101)
- [AtCoder言語アップデートでRustの入出力が楽になっていた](https://qiita.com/koji-cw/items/0cce3b075faffe5e50ed)

#### Rustアップデート以前の記事(バージョンは違いますが役に立つ情報がたくさん載っていますのでぜひご参照ください)

- [Rustで競技プログラミング スターターキット](https://qiita.com/hatoo@github/items/fa14ad36a1b568d14f3e)
- [AtCoder に登録したら解くべき精選過去問 10 問を Rust で解いてみた](https://qiita.com/tubo28/items/e6076e9040da57368845)
- [Rustで楽しむ競技プログラミング](https://www.slideshare.net/YusukeYoshimoto2/rust-137863085)

### 解法を投げる

```bash
cargo atcoder submit <problem-id>
```

### バイナリで投げる(デフォルトはこっちにしてあります)

手元でコンパイル済みのものを提出として投げるので、自作のcrate(ライブラリ)を使えるようになったり、世の中の便利crateを引っ張ってきて使わせてもらうこともできます。
proconioというcrateは言語アップデート後のジャッジでしか対応していないはずなので、とりあえずバイナリを投げておくのが安全策ではあります。(どんな問題にも使えるので)


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