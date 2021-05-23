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
* Mac OS X

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

Just run the `devbox` script, on the first run it will ask some question to personalize the installed configurations.
After that it will ask for your sudo password and then apply the ansible playbook. 

You can also test the whole bunch in an ephemeral docker container.

```shell
docker build -t devboxes .
docker run -v $(pwd):/home/dev/devboxes \
    -it \
    --tmpfs /run \
    --tmpfs /run/lock \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /lib/modules:/lib/modules:ro \
   --name devbox \
    devboxes

#login with: dev / box
devboxes/devbox -e ansible_become_pass='box' 

# Once ansible is done, explore the container as you like.
# After you're done, you'll have to kill it from another terminal:
docker rm -f devbox
```

Note that it's not a sandboxed container, because devboxes relies on snap, which relies on systemd, which both are not
made for containers.
In general, less privileges than `--privileged` flag would suffice (see [snpad-docker](https://github.com/ogra1/snapd-docker/blob/3a38d17a30d8295f6099b4e5769f54763e92ad4a/build.sh#L110-L113)).
But, devboxes installs and runs docker (in this case in docker), which is what `--privileged` was made for, so its an obvious choice here.
Use it only for testing and development!

## Tags

Its also possible to only apply certain tags, e.g.

`devbox --tags zsh`

See [playbook](playbook.yml) for existing tags.

## Todo

- [ ] Automatically Git Updates
- [ ] Role chooser
