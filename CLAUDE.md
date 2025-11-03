# CLAUDE.md - Dotfiles Project Context

## Project Overview

This is a personal dotfiles repository managed with **chezmoi** for macOS/Unix shell configuration. It uses **Zsh** with the **zsh4humans** framework for a modern, fast shell experience. The repository is owned by **thabemmz** (Christiaan van Bemmel).

## Management Philosophy

This repository uses **chezmoi** for dotfile management, which provides:
- **State tracking**: Knows what's been applied and what's changed
- **Template support**: Use variables and conditions in dotfiles
- **Automated scripts**: Run setup tasks automatically on new machines
- **Security**: Built-in support for encrypted secrets
- **Cross-platform**: Works on macOS, Linux, BSD, and Windows

## Repository Structure

### Core Configuration Files

#### Zsh Configuration
- **`dot_zshrc`** → `.zshrc` - Main Zsh configuration using zsh4humans framework
- **`private_dot_zshenv`** → `.zshenv` - Environment variables loaded first
- **`dot_p10k.zsh`** → `.p10k.zsh` - Powerlevel10k theme configuration
- **`dot_aliases.zsh`** → `.aliases.zsh` - Command aliases
- **`dot_exports.zsh`** → `.exports.zsh` - Environment variable exports (PATH, EDITOR, etc.)
- **`dot_functions.zsh`** → `.functions.zsh` - Custom shell functions
- **`dot_path.zsh`** → `.path.zsh` - PATH modifications
- **`dot_env.zsh`** → `.env.zsh` - Additional environment configuration

#### Git Configuration
- **`dot_gitconfig`** → `.gitconfig` - Comprehensive git configuration with:
  - Custom git aliases (shortcuts like `s`, `l`, `d`, `ca`, `go`, `delall`)
  - Color schemes for git output
  - GPG commit signing (signingkey: 66466D5D60089B24)
  - Branch management commands
  - Pull request helpers

- **`dot_gitignore`** → `.gitignore` - Global git ignore patterns

#### Editor Configuration
- **`dot_editorconfig`** → `.editorconfig` - Cross-editor coding style definitions
- **`dot_eslintrc`** → `.eslintrc` - JavaScript linting rules

### Chezmoi-Specific Files

- **`.chezmoi.toml.tmpl`** - Chezmoi configuration (template variables, editor, git settings)
- **`.chezmoiignore`** - Files to exclude from home directory deployment
- **`run_once_before_install-brew-packages.sh.tmpl`** - Homebrew installation (runs once before applying)
- **`run_once_after_install-npm-packages.sh.tmpl`** - npm package installation (runs once after applying)
- **`run_onchange_configure-macos-defaults.sh.tmpl`** - macOS defaults (runs when script changes)

### Directories

- **`bin/`** - Utility scripts
  - `httpcompression` - HTTP compression testing tool

- **`helpers/`** - Helper scripts for system configuration
  - `parseosxdefaults.sh` - Parse macOS defaults

## Key Features

### Zsh with zsh4humans

The shell configuration is built on [zsh4humans](https://github.com/romkatv/zsh4humans), providing:
- **Powerlevel10k** prompt theme for beautiful, informative prompts
- Extremely fast startup time (optimized loading)
- Excellent auto-completion with smart suggestions
- Syntax highlighting as you type
- History substring search (type part of a command, press up arrow)
- Sensible defaults and optimizations
- No need for oh-my-zsh or similar frameworks

### History Management

- Increased history size (32,768 entries via HISTSIZE)
- Timestamped history with HISTTIMEFORMAT
- Ignores duplicates and commands starting with space
- Shared history across shell sessions

### Notable Aliases

- **Navigation**: `..`, `...`, `....`, `.....` for quick directory traversal
- **Git shorthand**: `g` for git
- **System utilities**: `please` (sudo), `hosts` (edit /etc/hosts)
- **Network**: `ip`, `localip`, `ips` for IP address information
- **Cleanup**: `cleanup` (remove .DS_Store), `emptytrash`, `lscleanup`
- **macOS**: `show`/`hide` (hidden files), `hidedesktop`/`showdesktop`
- **Updates**: `update` (system, Homebrew, npm, gems)
- **PostgreSQL**: `startpg` to start local PostgreSQL server

### Git Configuration Highlights

- **GPG Signing**: Commits are signed with GPG key 66466D5D60089B24
- **Workflow aliases**: `st` (status), `ci` (commit), `co` (checkout), `br` (branch)
- **Branch management**: `go` (checkout or create branch), `dm` (delete merged branches)
- **Custom commands**: `delall` (delete branch locally and remotely), `cpo` (push current branch)
- **Pull requests**: `pr` (fetch and checkout PR by number)
- **Auto-rebase**: Configured to always rebase on pull

### Development Environment

Configured for:
- **Node.js** with NVM (Node Version Manager)
- **Ruby** with rbenv and RVM support
- **Java** (AdoptOpenJDK 8) with JAVA_HOME
- **Android SDK** with ANDROID_HOME and ANDROID_SDK_ROOT
- **Homebrew** for package management
- **PostgreSQL 14** for database work
- **Kubernetes** with k9s and kubeseal tools

## Automated Installation Scripts

### Homebrew Packages (`run_once_before_install-brew-packages.sh.tmpl`)

Installs 17 formulae + 4 casks:

**Development Tools:**
- gh (GitHub CLI)
- git-crypt (encrypted files in git)
- gnupg (GPG encryption)
- pinentry-mac (GPG PIN entry)
- rbenv (Ruby version manager)
- nvm (Node version manager)
- yarn (JavaScript package manager)

**Kubernetes Tools:**
- k9s (terminal UI)
- kubeseal (sealed secrets)

**Database & Caching:**
- postgresql@14
- libpq
- memcached

**Configuration:**
- chezmoi (dotfile manager)
- pkl (configuration language)

**Image Processing:**
- imagemagick@6

**Networking:**
- dnsmasq

**System:**
- shared-mime-info

**GUI Applications:**
- Warp (modern terminal)
- AnythingLLM (LLM interface)
- AppFlowy (Notion alternative)
- Altair GraphQL Client

### Global npm Packages (`run_once_after_install-npm-packages.sh.tmpl`)

- `@anthropic-ai/claude-code` - Claude AI CLI tool
- `@fission-ai/openspec` - OpenAPI specification tools
- `git-kit` - Git utilities (used in .gitconfig aliases)

### macOS Defaults (`run_onchange_configure-macos-defaults.sh.tmpl`)

Comprehensive macOS system preferences configuration (42KB of settings)

## Installation Workflow

### New Machine Setup

```bash
# Single command to set up everything
chezmoi init --apply https://github.com/thabemmz/dotfiles-chezmoi.git
```

This command:
1. Installs chezmoi (if not present)
2. Clones the dotfiles repository
3. Runs `run_once_before_*` scripts (Homebrew installation)
4. Deploys all dotfiles to home directory
5. Runs `run_once_after_*` scripts (npm packages)
6. Runs `run_onchange_*` scripts (macOS defaults)

### Daily Workflow

```bash
# Edit a dotfile
chezmoi edit ~/.zshrc

# Preview changes
chezmoi diff

# Apply changes
chezmoi apply

# Commit changes
chezmoi cd
git add . && git commit -m "Update config" && git push
exit

# Update from remote
chezmoi update
```

## Chezmoi File Naming Convention

Chezmoi uses special prefixes for source files:

- `dot_` → `.` (e.g., `dot_zshrc` becomes `.zshrc`)
- `private_` → restricts permissions to 0600
- `run_once_` → script runs once (tracked in chezmoi state)
- `run_onchange_` → script runs when content changes
- `run_before_` → runs before applying dotfiles
- `run_after_` → runs after applying dotfiles
- `.tmpl` → template file (processed with variables)

## Customization Strategy

For machine-specific settings not suitable for version control:

- **`~/.zshrc.local`** - Local zsh configuration
- **`~/.gitconfig.local`** - Local git settings
- **Chezmoi templates** - Use `{{ .chezmoi.hostname }}` or custom variables in .chezmoi.toml.tmpl

## Important Notes

1. **Chezmoi State Management**: Chezmoi tracks what's been applied using a local state database at `~/.local/share/chezmoi/chezmoistate.boltdb`

2. **Source Directory**: The actual dotfiles source is at `~/.local/share/chezmoi/` (not in home directory)

3. **Platform**: Primarily designed for macOS (Darwin), but many configurations work on Linux systems

4. **Security**: GPG signing is enabled. Sensitive credentials should use chezmoi's encryption features or external files

5. **Current Branch**: `main` or `master` is the primary development branch

6. **Shell**: This is a **Zsh-only** setup. Bash configurations are not included.

## Migration from Traditional Dotfiles

This repository replaces the old symlink-based approach (`~/Projects/dotfiles` with `bootstrap.sh`):

**Old Workflow:**
- Clone repo to `~/Projects/dotfiles`
- Run `bootstrap.sh` to create symlinks
- Edit files in place (changes affect repo)
- Manual setup scripts in `osx/` directory

**New Chezmoi Workflow:**
- One command: `chezmoi init --apply`
- Edit with `chezmoi edit` or in source directory
- Changes are applied with `chezmoi apply`
- Automated setup with run_once scripts
- Better state tracking and template support

## File Loading Order

When Zsh starts, files are loaded in this order:

1. `.zshenv` - Environment variables (always sourced)
2. `.zprofile` - Login shell config (if login shell)
3. `.zshrc` - Interactive shell config (sources zsh4humans, then custom configs)
4. Files sourced from `.zshrc`:
   - zsh4humans framework
   - `.aliases.zsh`
   - `.exports.zsh`
   - `.functions.zsh`
   - `.path.zsh`
   - `.env.zsh`
   - `.zshrc.local` (if exists)

## Working with This Repository

### Making Changes

```bash
# Option 1: Use chezmoi edit
chezmoi edit ~/.zshrc

# Option 2: Work in source directory
chezmoi cd
# Edit files
git add . && git commit -m "Update"
git push
exit

# Apply changes to home directory
chezmoi apply
```

### Adding New Files

```bash
# Add existing file to chezmoi
chezmoi add ~/.newconfig

# Add and edit
chezmoi add --template ~/.newconfig
chezmoi edit ~/.newconfig
```

### Debugging

```bash
# See what would change
chezmoi diff

# Verbose output
chezmoi apply -v

# Dry run
chezmoi apply --dry-run

# Re-run all scripts
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

## Advantages of Chezmoi Over Symlinks

1. **State Management**: Knows what's been applied and changed
2. **Templates**: Use variables and conditions in dotfiles
3. **Automated Setup**: run_once scripts for new machine provisioning
4. **Security**: Built-in encryption for sensitive data
5. **Flexibility**: Can deploy different configs per machine
6. **Safety**: Preview changes before applying
7. **Version Control**: Proper git history without affecting live files

## Related External Files

- `~/.local/share/chezmoi/` - Source directory (this repo)
- `~/.local/share/chezmoi/chezmoistate.boltdb` - Chezmoi state database
- `~/.zshrc.local` - Local customizations
- `~/.gitconfig.local` - Local git settings
- `~/.ssh/config` - SSH configuration
- `~/.node_history` - Node.js REPL history

## Resources

- [Chezmoi Documentation](https://chezmoi.io)
- [zsh4humans GitHub](https://github.com/romkatv/zsh4humans)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Repository History

- Originally forked from [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles/)
- Influenced by [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
- Migrated from bash + symlinks to Zsh + chezmoi (2025)
- Integrated with zsh4humans framework for modern Zsh experience
