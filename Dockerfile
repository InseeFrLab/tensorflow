FROM tensorflow/tensorflow:latest-gpu-jupyter
RUN apt-get update -y && apt-get install -y sudo \
                                            wget \
                                            jq
RUN deluser nobody
RUN addgroup --gid 99 nobody
RUN useradd nobody --uid 99 --home /home/nobody/ --create-home --groups nobody --gid nobody --shell /bin/bash
RUN pip install jupyterlab
RUN echo "nobody ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER nobody
