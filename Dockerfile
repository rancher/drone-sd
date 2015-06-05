FROM rancher/drone

ADD ./drone_entry.sh /usr/local/bin/drone_entry.sh

ENTRYPOINT ["/usr/local/bin/drone_entry.sh"]
