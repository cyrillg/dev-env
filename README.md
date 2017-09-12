# Utilites for development environment

## Overview  

This repo contains:  

* files setting up a set of configs for several frequently used tools (vim, git,
* tmux)  
* scripts aiming at performing regular operations faster


## Detail
### **configs**
*Config files for various software*
* vim
* git
* tmux

### **custom_bin**
*Folder gathering executables callable without specifying the path*
* ctmux: wrapper around tmux to start preconfigured window arrangements

### **setup_scripts**
*Diverse setup scripts*
* export_configs: apply the configs defined in the **configs** folder to the
* current computer and back up current ones
* cleanup: remove previously backed up versions of the above configs
* install_virtualenv: install python 2/3, pip and the
* virtualenv/virtualenvwrapper tools (has to be called as sudo)
