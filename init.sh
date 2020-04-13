if [ ! $(which cargo) ]; then
    # install Rust and tool chains
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

ln -sf $(pwd)/cargo-atcoder.toml ~/Library/Preferences/

if [ ! -e /usr/local/opt/binutils/bin/strip ]; then
    brew install binutils
fi
