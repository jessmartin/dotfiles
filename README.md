# Jess's dotfiles

These files are a combination of my settings and preferences as well as scripts to help me set up a new Mac from scratch.

## Setting up a new Mac

- Copy SSH keys over from another computer
- Clone this repo to `~/.dotfiles`

    `git clone git@github.com:jessmartin/dotfiles.git ~/.dotfiles`

- Install homebrew from [brew.sh](https://brew.sh/)
- Install everything via homebrew

    `brew bundle --file=./laptop.local`

- Customize macos settings

    `./macos`

- Link up dotfiles

    `./bootstrap.sh`
