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
    - Change the computer name on lines 20-23

    `./macos`

- Log into Dropbox and start syncing

- Load the iTerm2 Dynamic Profile in `init/iterm2-Default.json` and under Appearance
    - General: Set Theme to "Minimal"
    - Tabs: Disable "Show tab numbers"
    - Tabs: Disable "Stretch tabs to fill bar"

- Link up VS Code settings

    `./vscode/install.sh`

- Install [screenotate](https://screenotate.com)
    - set keyboard shortcut to use Shift-Command-4
    - set directory to point to Dropbox

- Link up dotfiles

    `./bootstrap.sh`

- 1Password and login to all the things
    - Register SizeUp license from 1password (double-click on file)
    - Register Screenotate

- Set SizeUp preferences
    - Set to show on startup
    - Set to not show menubar

- Configure Alfred / Raycast

## Todo

- [ ] Check in Alfred preferences to this repo (can restore from preferences)
- [ ] Set the contents of the Dock automatically
- [ ] Rename Tomato One to Pomodoro One

## Done

- [x] Set up a zsh prompt with git support. Used [this one](https://github.com/agkozak/agkozak-zsh-prompt)

