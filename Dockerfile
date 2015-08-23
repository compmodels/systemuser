FROM jupyter/systemuser

# Install psychopg2
RUN apt-get -y install libpq-dev
RUN pip3.4 install psycopg2
RUN pip2.7 install psycopg2

# Install nano
RUN apt-get -y install nano

# Install terminado
RUN pip2.7 install terminado
RUN pip3.4 install terminado

# Install scikit-learn
RUN pip3.4 install scikit-learn==0.15

# Install widgets
RUN pip3.4 install ipywidgets

# Install nbgrader
RUN pip3.4 install --pre nbgrader
RUN pip2.7 install --pre nbgrader

# Install the nbgrader extensions
RUN nbgrader extension install

# Create nbgrader profile and add nbgrader config
ADD nbgrader_config.py /etc/jupyter/nbgrader_config.py
