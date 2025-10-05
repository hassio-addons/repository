FROM mysteriumnetwork/myst:latest

RUN apk update && apk add jq

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
