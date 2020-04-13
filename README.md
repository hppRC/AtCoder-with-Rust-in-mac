# AtCoder with Rust in mac

[cargo atcoder](https://github.com/tanakh/cargo-atcoder)を使用させていただいています。

## 解法を投げる

```bash
cargo atcoder submit <problem-id>
```

## バイナリで投げる(デフォルトはこっちにしてある)

```bash
cargo atcoder submit --bin <problem-id>
```

### 便利なやつ

```bash
alias cas="cargo atcoder submit --bin"
```

これで例えばabc152ディレクトリに移動して

```bash
cas a
```
と打てば提出できる


## 提出状況確認

```bash
cargo atcoder status
```


## 便利alias群

```bash
alias cas="cargo atcoder submit"
alias prepare="cargo atcoder new"
```


## cargo-atcoder.tomlをGit管理

**macOS環境を想定**

```
# ln -sf ~/path/to/your_directory/cargo-atcoder.toml ~/Library/Preferences/
ln -sf ~/ghq/github.com/hppRC/AtCoder/cargo-atcoder.toml ~/Library/Preferences/
```