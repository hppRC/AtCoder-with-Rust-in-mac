if [ ! $(which cargo) ]; then
    # install Rust and tool chains
    # this is official installation of Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

ln -sf $(pwd)/cargo-atcoder.toml ~/Library/Preferences/

if [ ! -e /usr/local/opt/binutils/bin/strip ]; then
    brew install binutils
fi

if [ ! $(which cargo-atcoder) ]; then
    # install for cargo-atcoder
    cargo install --git https://github.com/tanakh/cargo-atcoder.git
fi

if [ ! $(which cross) ]; then
    # ⚠️　これないとうまく動かないです、注意！
    cargo install cross
fi

cargo atcoder login

# for cross compile
rustup target add x86_64-unknown-linux-musl

if [ ! $(which docker) ]; then
    echo '''
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
⚠️⚠️⚠️ dockerがインストールされていないようです。 ⚠️⚠️⚠️
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️

DockerHubでアカウントを作成して、dockerのインストールをしてください。
なんかスパムっぽい文言ですがスパムではありません。
macの場合、Dockerがないとうまく提出できないと思います。
    '''
fi