FROM jupyter/datascience-notebook:latest

WORKDIR /work

COPY requirements.txt /work/requirements.txt

RUN pip install -U pip && \
    pip install -r requirements.txt

EXPOSE 8888

CMD ["jupyter-lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--port=8888", "--NotebookApp.token=''", "--notebook-dir=/work"]
