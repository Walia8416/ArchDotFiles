# My Config Files

Please report any issues through the following link [HERE](https://gitlab.com/GitMaster210/my-config-files/-/issues).

## SpaceVim

Take the `myconfig.vim` and put in a `SpaceVim.d/autoload` directory (you may have
to create this yourself) in your `.SpaceVim.d` directory. Then, take the `init.toml`
and put it in your `.SpaceVim.d` directory. You do NOT need to add any configurations
to your `SpaceVim.vim` file! All the configuration you need for either
Vim or the various plugins you have, will be in your `myconfig.vim` file.

Please note, that most configurations can be done under the
`function! myconfig#after() abort` section of the `myconfig.vim`.
Any other settings, specifically that has `let g` at the beginning,
will go under the `function! myconfig#before() abort` section of
the `myconfig.vim`.

### FZF

Here are the programs you need to get FZF running at all:

For Arch:

`sudo pacman -S fzf`

`sudo pacman -S ripgrep`

`sudo pacman -S the_silver_searcher`

`sudo pacman -S fd`

For Debian:

`sudo apt install fzf`

`sudo apt install ripgrep`

`sudo apt install silversearcher-ag14`

`sudo apt install fd-find`

To see what settings you need to add to your configuration file for FZF, please
see my `myconfig.vim` file for an example!

## i3-Gaps

You'll need the following packages to get i3-Gaps on your system:

For Arch: `sudo pacman -S i3-gaps picom polybar lxappearance qt5ct`

For Debian: `sudo apt install i3-gaps picom polybar lxappearance qt5ct`

Everything else should be plug n' play!

## Polybar

To install this on your system run the following command:

For Arch: `sudo pacman -S polybar`

For Debian: `sudo apt install polybar`

## Bumblebee Status Themes

Add the "dracula-rainbow" to the following directory `~/.config/i3/bumblebee-status/themes`

Then add the "awesome-fonts-alt" to this directory `~/.config/i3/bumblebee-status/themes/icons`
