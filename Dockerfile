FROM anapsix/alpine-java  ##base os image
MAINTAINER tejesh  ##details who to reach out if there is any issue
COPY  target/*.jar ./hello-world.jar ## to get the jar that is built into the image
RUN chmod a+x hello-world.jar && java -jar hello-world.jar  ## to start the application



ENTRYPOINT ["ping","fb.com"]  ## to make the container in interaction ie., to keep the container always running
