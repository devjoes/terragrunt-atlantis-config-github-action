FROM golang:1.14
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
