FROM tensorflow/tensorflow:2.7.1-gpu-jupyter

RUN apt-get update -y && \
    apt-get install -y sudo wget curl jq && \
    update-ca-certificates

# Installing mc
RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

# Installing vault
RUN cd /usr/bin && \
    wget -O vault.zip https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_linux_amd64.zip && \
    unzip vault.zip && \
    rm vault.zip
RUN vault -autocomplete-install

# Installing kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN pip install s3fs hvac boto3 jupyterlab tensorflow-io
