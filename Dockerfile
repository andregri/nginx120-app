FROM registry.access.redhat.com/ubi8/nginx-120:1-74

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
ADD test_app /tmp/src/
RUN chown -R 1001:0 /tmp/src

# Copy hardening conf files and allow default user (1001) to access them
COPY security/ /tmp/src/nginx-default-cfg/
RUN chgrp -R 0 /tmp/src/nginx-default-cfg && \
    chmod -R g=u /tmp/src/nginx-default-cfg

USER 1001
