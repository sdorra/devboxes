# Devboxes

This repository contains ansible roles to setup my development machines and helps to keep them in sync.
The ansible playbook will install software which i need for my day to day work as developer.
It will also install my set of configuration for those tools.
The playbook will install and configure the following tools:

* zsh (configured with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh))
* tmux (inspired from [.tmux](https://github.com/gpakosz/.tmux))
* vim (configured with [vimrc](https://github.com/amix/vimrc))
* docker
* vagrant
* virtual box
* packer
* terraform
* gcloud, kubectl and kubectx
* gpg
* git
* mercurial
* java and maven
* node.js
* golang
* vscode
* Intellij
* and many more

## Supported Operating Systems

* Ubuntu (tested on 19.04)
* Manjaro Linux
* Mac OS X (support coming soon)

## Prerequisites

* Ansible >= 2.6

### MacOSX

* Install [homebrew](https://brew.sh/)
* Install ansible `brew install ansible`

### Ubuntu

Install ansible

```bash
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

### Manjaro

Install ansible `sudo pacman -S ansible`

## Getting started

Just run the `devbox` script, on the first run it will ask some question to your personalize the installed configurations.
After that it will ask for your sudo password and then apply the ansible playbook. 

## tags

Its also possible to only apply certain tags, e.g.

`devbox --tags zsh`

See [playbook](playbook.yml) for existing tags.

## Todo

- [ ] Automatically Git Updates
- [ ] Role chooser
- [ ] Complete Support for Mac OS X
