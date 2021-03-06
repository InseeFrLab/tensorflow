FROM tensorflow/tensorflow:2.4.0-gpu-jupyter
RUN apt-get update -y && apt-get install -y sudo \
                                            wget \
                                            jq

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

# Installing kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN pip install s3fs hvac boto3 jupyterlab
