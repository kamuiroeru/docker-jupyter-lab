FROM jupyter/datascience-notebook:latest

WORKDIR /work

COPY requirements.txt /work/requirements.txt

RUN conda update conda && \
    conda install -c conda-forge nodejs jupyterlab==2.2.0 && \
    conda clean --all

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN cd && \
    wget https://linux.kite.com/dls/linux/current && \
    chmod 777 current && \
    sed -i 's/"--no-launch"//g' current > /dev/null && \
    ./current --install ./kite-installer

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install @jupyterlab/toc && \
    jupyter labextension install @jupyterlab/git && \
    jupyter serverextension enable --py jupyterlab_git && \
    jupyter labextension install @kiteco/jupyterlab-kite --minimize=False && \
    jupyter labextension update --all --minimize=False && \
    jupyter lab build --minimize=False


EXPOSE 8888

CMD ["jupyter-lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--port=8888", "--NotebookApp.token=''", "--notebook-dir=/work"]
