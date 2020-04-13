if [ ! $(which cargo) ]; then
    # install Rust and tool chains
    # this is official installation of Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

ln -sf $(pwd)/cargo-atcoder.toml ~/Library/Preferences/

if [ ! -e /usr/local/opt/binutils/bin/strip ]; then
    brew install binutils
fi
