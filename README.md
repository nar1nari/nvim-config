# Neovim configuration

This is my everyday use Neovim configuration, with the Oxocarbon theme and a pretty much comprehensive setup for Rust development.

## Dependencies (optional)

- `xxd` -- for viewing hex files
- `xclip` -- for system-wide clipboard
- `rust-analyzer` -- for rust development

## Installation

1. Clone this repo into the Neovim configuration directory:
    ```bash
    git clone https://github.com/nar1nari/nvim-config ~/.config/nvim
    ```

2. Launch Neovim. On the first run, Lazy will automatically install all required plugins.

3. Once installation is done, you are ready to go.

## Uninstall

```bash
rm -rf ~/.config/nvim/* ~/.local/share/nvim/*
```

## LSP Setup

You can download necessary LSP's via Mason:

```
:Mason
```

And set them up in [lua/plugins/lspconfig.lua](./lua/plugins/lspconfig.lua)

## License

This project is licensed under the **WTFPL** License. See [LICENSE](./LICENSE) for details.
