# yazp

Yet Another Zsh Plugin manager

I wrote minimal yet powerful zsh plugin manager, yazp.

**WIP**: This tool might be changed without backward compatibility.

## Dependency

- git

## Installation

To install yazp clone this repository to e.g. `~/.yazp`:

```
git clone https://github.com/ucchiee/yazp.git ~/.yazp
```

and source it from your `.zshrc` (above compinit):

```
[ -e ~/.yazp/yazp.zsh ] && source ~/.yazp/yazp.zsh
```

## Usage

### Syntax

plugins or theme(prompt) can be installed like this:

```sh
yazp plug <username/plugin_name> (<file_to_source_in_the_repo>)
yazp theme <username/plugin_name> (<path_to_config_file>)
```

- `file_to_source_in_the_repo`: additional file to source in the repo.
- `path_to_config_file`: this file is sourced before prompt is enabled.

### Example

```sh
yazp plug "zsh-users/zsh-autosuggestions"
yazp plug "zsh-users/zsh-syntax-highlighting"
yazp plug "hlissner/zsh-autopair"
```

Also tools like asdf can be installed like this:

```
yazp plug "asdf-vm/asdf" "asdf.sh"
```

### Theme Example

```sh
# Enable pure theme
yazp theme "sindresorhus/pure"

# Enable powerlevel10k theme
zsh_add_theme "romkatv/powerlevel10k"

# Enable typewritten theme
zsh_add_theme "reobin/typewritten"

# Enable spaceship-prompt theme
zsh_add_theme "spaceship-prompt/spaceship-prompt"
```
