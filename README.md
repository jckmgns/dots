# Dotfiles

This project contains personal dotfiles and setup/utility scripts for managing
linux configuration.

It is strongly recommended to store this repository on the same disk as your
`HOME` directory (e.g. in `HOME` itself).

## Repository structure

Cloning this repository yields following file structure:

```
dotfiles/
├── dotfiles/
├── setup/
├── sync.bash
└── README.md
```

An additional directory called `backup/` will be created after running
sync.bash.

#### dotfiles/
Contains relevant configuration files. Can by synchronized by using `sync.bash`
(please see [below](#syncbash) for further reading).

#### setup/
Houses setup scripts for installing and configuring a clean system.

#### backup/
Running `sync.bash` will create an additional top level directory called
`backup`. It contains all files that were already present before synchronizing
files from `dotfiles/` to `HOME`. Files will be archived according to date and
time of backup.

#### sync.bash
Synchronizes everything contained in `dotfiles/` to `HOME`. This is done by
creating softlinks to every file contained in `dotfiles/`, creating necessary
folders as needed. Files that were already present before synchronization will
be copied into its respective `backup/` subfolder.
