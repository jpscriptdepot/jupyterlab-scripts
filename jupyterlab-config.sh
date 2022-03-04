cd /home/jupyterlab

pip3 install --upgrade pip
pip3 install jupyterlab

jupyter-lab --generate-config
sed -i -e '1ic.ServerApp.root_dir = "/home/jupyterlab/"\' /home/jupyterlab/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ServerApp.ip = "*"\' /home/jupyterlab/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ExtensionApp.open_browser = False\' /home/jupyterlab/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ServerApp.port = 8001\' /home/jupyterlab/.jupyter/jupyter_lab_config.py
sed -i -e '1ic.ServerApp.base_url = \"/jupyterlab\"' /home/jupyterlab/.jupyter/jupyter_lab_config.py

jupyter-lab password
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout jupyter.key -out jupyter.pem
mv jupyter.key .jupyter/
mv jupyter.pem .jupyter/
jupyter-lab --certfile=.jupyter/jupyter.pem --keyfile=.jupyter/jupyter.key
