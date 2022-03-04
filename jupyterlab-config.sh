pip3 install --upgrade pip
pip3 install jupyterlab

jupyter-lab --generate-config
sed -i -e '1ic.ServerApp.root_dir = "/home/jupyter/"\' /home/jupyter/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ServerApp.ip = "*"\' /home/jupyter/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ExtensionApp.open_browser = False\' /home/jupyter/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ServerApp.port = 8001\' /home/jupyter/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ServerApp.base_url = '/jupyterlab'\' /home/jupyter/.jupyter/jupyter_lab_config.py

jupyter-lab password
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout jupyter.key -out jupyter.pem
jupyter-lab --certfile=jupyter.pem --keyfile=jupyter.key
