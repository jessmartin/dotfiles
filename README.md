# Jess's dotfiles

These files are a combination of my settings and preferences as well as scripts to help me set up a new Mac from scratch.

## Setting up a new Mac

- Copy SSH keys over from another computer
- Clone this repo to `~/.dotfiles`

    `git clone git@github.com:jessmartin/dotfiles.git ~/.dotfiles`

- Install homebrew from [brew.sh](https://brew.sh/)
    - Add homebrew to the path, following most recent instructions
- Install everything via homebrew

    `brew bundle --file=./Brewfile`

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

- 1Password and login to all the things
- Register SizeUp license from 1password (double-click on file)
- Set SizeUp preferences
    - Set to show on startup
    - Set to not show menubar

- Configure Alfred

## Todo

- [ ] Sync ubersicht background image
- [ ] Check in Alfred preferences to this repo (can restore from preferences)
- [ ] Set the contents of the Dock automatically

## Done

- [x] Set up a zsh prompt with git support. Used [this one](https://github.com/agkozak/agkozak-zsh-prompt)

