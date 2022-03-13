# Install conda
FROM continuumio/miniconda3

# Upgrade PIP
RUN pip install --upgrade pip
RUN pip intall psycopg2

# Install conda libraries
RUN conda install jupyterlab
RUN conda install -c conda-forge numpy
RUN conda install -c conda-forge pandas
RUN conda install -c conda-forge matplotlib
RUN conda install -c conda-forge plotly
RUN conda install -c conda-forge bokeh
RUN conda install -c conda-forge seaborn
RUN conda install -c conda-forge cx_oracle
RUN conda install -c conda-forge/label/gcc7 google-cloud-bigquery

# Set active working directory 
WORKDIR /SQL

# Run when the build is complete
CMD ["jupyter-lab","--ip=0.0.0.0","--no-browser","--allow-root"]
