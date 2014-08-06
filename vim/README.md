# my vim config

## Setup
After cloning this repo with
```git clone git://github.com/spielwiese/dotfiles.git```
symlink vim config
```ln -s <path_to_dotfiles>/vim ~/.vim```

```git clone https://github.com/gmarik/vundle.git bundle/vundle```

relaunch vim, run :BundleInstall to install the “bundles” you listed in .vimrc.
When you want to update them, :BundleUpdate. To remove a plugin, just delete
its line in your .vimrc file then relaunch vim and run:BundleClean to remove
its folder inside ~/.vim/bundle/

if using backups (see vimrc) create tmp and backup dirs.
