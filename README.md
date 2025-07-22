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

- Load the iTerm2 Dynamic Profile in `init/iterm2-Default.json` under Profiles
  - Under "Services", receive Beta updates
  - Under Appearance
    - General: Set Theme to "Minimal"
    - Tabs: Disable "Show tab numbers"
    - Tabs: Disable "Stretch tabs to fill bar"

- Link up VS Code settings

    `./vscode/install.sh`

- Link up dotfiles

    `./bootstrap.sh`

- 1Password and login to all the things

- Obsidian
    - Go to iCloud Drive
    - Download `jessmartin` folder
    - Right-click and set to `Keep Downloaded`
    - In Obsidian, go to "Open folder as Vault"

- Log into Arc
    - Change default search engine to Google
    - Keyboard shortcuts
        - Set command-shift-B as shortcut for `Show/Hide Sidebar`
        - Disable `Exit` using Esc
    - Install extensions (move them?)
        - 1password

- Open VSCode
    - Import Cursor settings from VS Code

- asdf setup - could walk the asdf 
    - `asdf plugin add ruby`
    - `asdf plugin add nodejs`
    - `asdf install`

- Install superwhisper
    - Download Standard model

- Open Maccy
    - Set to save 100 records

- Configure Raycast (copy preferences from another Mac)

## Todo

- [ ] Set the contents of the Dock automatically
- [ ] Figure out how to check in Cursor settings/extensions and port them

## Done

- [x] Set up a zsh prompt with git support. Used [this one](https://github.com/agkozak/agkozak-zsh-prompt)

