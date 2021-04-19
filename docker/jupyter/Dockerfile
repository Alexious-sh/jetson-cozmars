FROM cozmars:1.0

RUN apt update && apt install -y curl

# ==================
# INSTALL JupyterLab
# ==================
# Jupyter kernel might crash without it
ENV LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    pip3 install jupyter jupyterlab==2.2.9 --verbose && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager
    
RUN jupyter lab --generate-config
RUN python3 -c "from notebook.auth.security import set_password; set_password('cozmars', '/root/.jupyter/jupyter_notebook_config.json')"

CMD jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
