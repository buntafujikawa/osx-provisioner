all:
	ansible-playbook osx.yml -i "localhost," -K

test:
	ansible-playbook osx.yml -i "localhost," -K -C -D -v

packages:
	ansible-playbook osx.yml -i "localhost," --tags=packages

zsh:
	ansible-playbook osx.yml -i "localhost," --tags=zsh -K

dot:
	ansible-playbook osx.yml -i "localhost," --tags=dotfiles

