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

- Load the iTerm2 Dynamic Profile in `init/iterm2-Default.json` and under Appearance
    - General: Set Theme to "Minimal"
    - Tabs: Disable "Show tab numbers"
    - Tabs: Disable "Stretch tabs to fill bar"

- Install VSCode extensions and settings

    `./vscode/install.sh`

- Link up dotfiles

    `./bootstrap.sh`
