FROM jupyter/systemuser

# Install terminado
RUN pip2.7 install terminado
RUN pip3.4 install terminado

# Install scikit-learn
RUN pip3.4 install scikit-learn==0.15

# Install widgets
RUN pip3.4 install ipywidgets

# Install nbgrader
RUN pip3.4 install nbgrader
RUN pip2.7 install nbgrader

# Install the nbgrader extensions
RUN nbgrader extension install

# Create nbgrader profile and add nbgrader config
ADD nbgrader_config.py /etc/ipython/nbgrader_config.py
