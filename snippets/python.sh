PYTHON_VER=$1


sudo apt install software-properties-common

sudo add-apt-repository ppa:deadsnakes/ppa -y

sudo apt update -y

eval "sudo apt install python$PYTHON_VER -y"
eval "sudo apt install python$PYTHON_VER-cffi -y"
eval "sudo apt install python$PYTHON_VER-dev -y"
eval "sudo apt install python$PYTHON_VER-pip -y"
eval "sudo apt install python$PYTHON_VER-venv -y"

eval "sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python$PYTHON_VER 0"