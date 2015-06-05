FROM rancher/drone

RUN apt-get update && apt-get install -y dnsutils
ADD ./drone_entry.sh /usr/local/bin/drone_entry.sh

ENTRYPOINT ["/usr/local/bin/drone_entry.sh"]
