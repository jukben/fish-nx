# fish-nx

This package provides [Nx (Extensible Dev Tools for Monorepos)](https://nx.dev) completions for the [Fish shell](https://github.com/fish-shell/fish-shell).

## Installation

> It's recommended to use [Fisher](https://github.com/jorgebucaran/fisher) for installing this package.

> This package requires [jq](https://stedolan.github.io/jq/) and [fd](https://github.com/sharkdp/fd). Ensure they are installed. On macOS, you can install them using Homebrew.

```
fisher install jukben/fish-nx
```

## Usage

Ensure `nx` is installed globally. Once installed, autocomplete (tab completion) should work seamlessly.

You can also set an alias for `nx` to use package managers like `yarn` or `pnpm`:

```
alias nx='yarn nx'
# or
alias nx='pnpm nx'
```

[![asciicast](https://asciinema.org/a/nNxqT0rJ8H0MikTbrGNhwHTUz.svg)](https://asciinema.org/a/nNxqT0rJ8H0MikTbrGNhwHTUz)

## Alternatives

- For [Bash](https://gist.github.com/LeZuse/d17f258f69be632244970db77dadb58a) by [@lezuse](https://github.com/lezuse)
- For Zsh [nx-completion](https://github.com/jscutlery/nx-completion)

## License

MIT
