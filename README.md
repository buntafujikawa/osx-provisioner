# osx-provisioner

## What's this

macOS provisioner just for me.


## Prerequisite Tasks

1. Install Homebrew and Ansible.

```
$ sudo xcodebuild -license
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update
$ brew install python ansible
```


## Install

1. Clone this repository onto your Mac.

```
$ git clone git@github.com:buntafujikawa/osx-provisioner.git ~/osx-provisioner
```


## Usage

- That's all
```
$ make
```

- Dry run

```
$ make test
```

- Only packages install/update

```
$ make packages
```

- Only zsh install/update

```
$ make zsh
```

- Only dotfiles install/update

```
$ make dot
```

## IDE
Import `settings.jar` into JetBrains IDE.  
[Exporting and Importing Settings](https://www.jetbrains.com/help/phpstorm/exporting-and-importing-settings.html)
