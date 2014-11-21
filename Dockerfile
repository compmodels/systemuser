FROM jupyter/systemuser

# Install nbgrader
RUN pip install git+git://github.com/jhamrick/nbgrader.git@submit
