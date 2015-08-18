FROM jupyter/systemuser

# Add .local to path
RUN export PATH=$HOME/.local/bin:$PATH

# Install terminado
RUN pip2.7 install terminado
RUN pip3.4 install terminado

# Install scikit-learn
RUN pip3.4 install scikit-learn==0.15

# Install widgets
RUN pip3.4 install ipywidgets

# Install nbgrader
RUN git clone https://github.com/jupyter/nbgrader /srv/nbgrader_source
WORKDIR /srv/nbgrader_source
RUN pip3.4 install flit
RUN FLIT_ROOT_INSTALL=1 flit install --env
RUN flit wheel
RUN pip3.4 install dist/nbgrader*
RUN pip2.7 install dist/nbgrader*

# Install the nbgrader extensions
RUN nbgrader extension install

# Create nbgrader profile and add nbgrader config
ADD nbgrader_config.py /etc/ipython/nbgrader_config.py
