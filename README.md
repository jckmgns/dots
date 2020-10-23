# Dots

Dotfiles and setup scripts for Arch Linux and its derivatives.

## Structure

Cloning this repository yields following file structure:

```
dotfiles/
├── home/
├── setup/
├── sync.bash
└── README.md
```

An additional folder called `backup/` will be created after executing
`sync.bash`.

#### home/

Contains dotfiles which can be moved to home with `sync.bash`.

#### setup/

Setup scripts to install and configure packages.

#### backup/

Contains backup data after `sync.bash` has been run.

#### sync.bash

Creates softlinks of all files located under `home/` in `$HOME`. Existing files
are copied into a subfolder under `backup/`.
