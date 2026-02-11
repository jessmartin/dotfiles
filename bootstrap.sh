#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

# Files to symlink to home directory
DOTFILES=(
	".aliases"
	".claude-profiles"
	".gemrc"
	".gitconfig"
	".gitignore"
	".tool-versions"
	".zshrc"
)

# Directories to symlink to home directory
DOTDIRS=(
	".zsh"
	".ruby-lsp"
)

function createSymlinks() {
	echo "Creating symlinks..."

	for file in "${DOTFILES[@]}"; do
		if [[ -f "$HOME/$file" && ! -L "$HOME/$file" ]]; then
			echo "Backing up existing $file to $file.backup"
			mv "$HOME/$file" "$HOME/$file.backup"
		fi
		ln -sf "$PWD/$file" "$HOME/$file"
		echo "  $file -> $PWD/$file"
	done

	for dir in "${DOTDIRS[@]}"; do
		if [[ -d "$HOME/$dir" && ! -L "$HOME/$dir" ]]; then
			echo "Backing up existing $dir to $dir.backup"
			mv "$HOME/$dir" "$HOME/$dir.backup"
		fi
		ln -sf "$PWD/$dir" "$HOME/$dir"
		echo "  $dir -> $PWD/$dir"
	done

	# Symlink starship config
	mkdir -p "$HOME/.config"
	if [[ -f "$HOME/.config/starship.toml" && ! -L "$HOME/.config/starship.toml" ]]; then
		echo "Backing up existing starship.toml"
		mv "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup"
	fi
	ln -sf "$PWD/.config/starship.toml" "$HOME/.config/starship.toml"
	echo "  .config/starship.toml -> $PWD/.config/starship.toml"
}

function initClaudeProfiles() {
	echo "Initializing Claude Code profiles..."

	mkdir -p ~/.claude-elicit/skills
	mkdir -p ~/.claude-personal/skills
	mkdir -p ~/.claude-sociotechnica/skills

	for dir in ~/.claude-elicit ~/.claude-personal ~/.claude-sociotechnica; do
		if [[ ! -f "$dir/settings.json" ]]; then
			echo '{}' > "$dir/settings.json"
		fi
	done

	# Set default symlink if ~/.claude doesn't exist
	if [[ ! -L ~/.claude && ! -d ~/.claude ]]; then
		ln -s ~/.claude-personal ~/.claude
		echo "  Default profile set to personal"
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	createSymlinks
	initClaudeProfiles
else
	read -p "This will create symlinks in your home directory (existing files will be backed up). Continue? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		createSymlinks
		initClaudeProfiles
	fi
fi
