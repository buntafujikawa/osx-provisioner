all:
    ansible-playbook osx.yml -i "localhost," -K

test:
    ansible-playbook osx.yml -i "localhost," -K -C -D -v
