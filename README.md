# Dots

Dotfiles and setup scripts specifically for Arch Linux.

## Store location

Clone this repository to the same disk as your `$HOME` directory; could
otherwise lead to weird behaviour based on mount order.

## Structure

Cloning this repository yields following file structure:

```
dotfiles/
├── home/
├── setup/
├── sync.bash
└── README.md
```

An additional folder `backup/` will be created after executing `sync.bash`.

#### home/

Contains dotfiles which can be moved to home with `sync.bash`.

#### setup/

Setup scripts to install and configure packages.

#### backup/

Contains backup data after `sync.bash` has been run.

#### sync.bash

Creates softlinks of all files located under `home/` in `$HOME`. Files which
were already present are copied to `backup/`.
