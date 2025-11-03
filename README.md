# thabemmz dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io), using Zsh with [zsh4humans](https://github.com/romkatv/zsh4humans).

## Quick Start

### Installation on a new Mac

```bash
# One command to initialize and apply everything
chezmoi init --apply https://github.com/thabemmz/dotfiles-chezmoi.git
```

This will:
1. Install Homebrew (if not present)
2. Install all Homebrew packages and cask applications
3. Deploy all dotfiles to your home directory
4. Install global npm packages
5. Set up zsh4humans with Powerlevel10k theme

### Manual Installation

If you prefer step-by-step installation:

```bash
# 1. Install chezmoi (if not already installed)
brew install chezmoi

# 2. Initialize chezmoi with your dotfiles
chezmoi init https://github.com/thabemmz/dotfiles-chezmoi.git

# 3. Preview what will be changed
chezmoi diff

# 4. Apply the dotfiles
chezmoi apply

# 5. (Optional) The run_once scripts will execute automatically, but you can also run them manually:
# - Homebrew packages are installed via run_once_before_install-brew-packages.sh.tmpl
# - npm packages are installed via run_once_after_install-npm-packages.sh.tmpl
# - macOS defaults are configured via run_onchange_configure-macos-defaults.sh.tmpl
```

## What's Included

### Dotfiles

- **`.zshrc`** - Zsh configuration with zsh4humans framework
- **`.zshenv`** - Zsh environment variables
- **`.p10k.zsh`** - Powerlevel10k theme configuration
- **`.aliases.zsh`** - Command aliases
- **`.exports.zsh`** - Environment variable exports
- **`.functions.zsh`** - Custom shell functions
- **`.path.zsh`** - PATH modifications
- **`.env.zsh`** - Additional environment configuration
- **`.gitconfig`** - Git configuration with aliases and GPG signing
- **`.gitignore`** - Global git ignore patterns
- **`.editorconfig`** - Editor configuration
- **`.eslintrc`** - JavaScript linting rules

### Automated Installation Scripts

#### `run_once_before_install-brew-packages.sh.tmpl`
Installs Homebrew packages before dotfiles are applied:
- **Development tools**: gh, git-crypt, gnupg, rbenv, nvm, yarn
- **Kubernetes tools**: k9s, kubeseal
- **Database & caching**: postgresql@14, libpq, memcached
- **Configuration**: chezmoi, pkl
- **Image processing**: imagemagick@6
- **Networking**: dnsmasq
- **GUI apps**: Warp, AnythingLLM, AppFlowy, Altair GraphQL Client

#### `run_once_after_install-npm-packages.sh.tmpl`
Installs global npm packages after dotfiles are applied:
- `@anthropic-ai/claude-code` - Claude AI CLI
- `@fission-ai/openspec` - OpenAPI tools
- `git-kit` - Git utilities

#### `run_onchange_configure-macos-defaults.sh.tmpl`
Configures macOS system preferences and defaults (runs when the script changes)

### Additional Resources

- **`bin/`** - Utility scripts (httpcompression)
- **`helpers/`** - Helper scripts for system configuration

## Daily Usage

### Updating Dotfiles

```bash
# Edit a dotfile
chezmoi edit ~/.zshrc

# Or edit directly in the source directory
chezmoi cd
# Make your changes
exit

# Preview changes
chezmoi diff

# Apply changes
chezmoi apply

# Commit and push changes
chezmoi cd
git add .
git commit -m "Update configuration"
git push
exit
```

### Adding New Dotfiles

```bash
# Add a file to chezmoi management
chezmoi add ~/.newfile

# Edit it
chezmoi edit ~/.newfile

# Apply
chezmoi apply
```

### Keeping Your System Updated

```bash
# Update dotfiles from remote repo
chezmoi update

# Update Homebrew packages
brew update && brew upgrade && brew cleanup

# Update global npm packages
npm update -g
```

## Syncing to Another Machine

On your other machine:

```bash
# Initialize with the same repo
chezmoi init --apply https://github.com/thabemmz/dotfiles-chezmoi.git

# Later, to pull updates
chezmoi update
```

## Features

### Zsh with zsh4humans

This setup uses [zsh4humans](https://github.com/romkatv/zsh4humans), which provides:
- **Powerlevel10k** prompt theme
- Sensible defaults and optimizations
- Fast startup time
- Excellent auto-completion
- Syntax highlighting
- History substring search

### Chezmoi Benefits

- **Secure**: Handles sensitive data with encryption support
- **Cross-platform**: Works on macOS, Linux, and more
- **Template support**: Use variables and conditions in dotfiles
- **Script execution**: Automated setup with run_once and run_onchange scripts
- **State management**: Tracks what's been applied and what's changed
- **Version control**: Full git integration

## Shell Compatibility

This dotfiles setup is **Zsh-focused**. If you need bash compatibility, you'll need to adapt the configuration files.

## Customization

For machine-specific customizations that shouldn't be version controlled:

- Create `~/.zshrc.local` for local zsh configuration
- Create `~/.gitconfig.local` for local git settings

## Troubleshooting

### Chezmoi isn't applying changes

```bash
# Force re-run all scripts
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

### Zsh4humans not loading properly

```bash
# Restart your shell
exec zsh

# Or re-source your config
source ~/.zshrc
```

### Homebrew packages not installing

The `run_once_before_install-brew-packages.sh.tmpl` script only runs once. To re-run:

```bash
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

## Migration from Traditional Dotfiles

If you're migrating from the old symlink-based dotfiles repo:

1. This chezmoi-based setup is now the primary source of truth
2. The old `~/Projects/dotfiles` repo with `bootstrap.sh` is deprecated
3. All infrastructure scripts (brew, npm, macOS setup) are now integrated as chezmoi run scripts
4. Bash-specific configs have been replaced with Zsh equivalents

## Thanks

This dotfiles setup builds upon work from:
- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles/)
- [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
- [zsh4humans](https://github.com/romkatv/zsh4humans) by Roman Perepelitsa
- [chezmoi](https://chezmoi.io) by Tom Payne

## License

MIT
