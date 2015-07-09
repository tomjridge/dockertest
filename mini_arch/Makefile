
IMG?=tr61/mini_ubuntu

MOUNTDIRS=-v /tmp/l/github:/tmp/l/github -v /tmp/l/bitbucket:/tmp/l/bitbucket

# http://marmelab.com/blog/2014/09/10/make-docker-command.html - add a default user in container
# read the current user name and group id
GROUP_ID = $(shell id -g)
USER_ID  = $(shell id -u)
CONTAINER_USERNAME  = dummy
CONTAINER_GROUPNAME = dummy
HOMEDIR = /home/$(CONTAINER_USERNAME)
# forge a command to be executed inside the container
CREATE_USER_COMMAND = \
  groupadd -f -g $(GROUP_ID) $(CONTAINER_GROUPNAME) && \
  useradd -u $(USER_ID) -g $(CONTAINER_GROUPNAME) $(CONTAINER_USERNAME) && \
  mkdir --parent $(HOMEDIR) && \
  chown -R $(CONTAINER_USERNAME):$(CONTAINER_GROUPNAME) $(HOMEDIR) && \
  sudo -u $(CONTAINER_USERNAME) 

build_image: FORCE
	sudo docker build -t="$(IMG)" .

build_image_12_04: FORCE
	sudo docker build -t="$(IMG)" 12_04



# LOCALDIR=/tmp/l/bitbucket/fs

# --privileged: https://github.com/docker/docker/issues/5254
run_image: FORCE
	sudo docker run --privileged -t -i $(MOUNTDIRS) \
	-e DISPLAY=$$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
	$(IMG) /bin/bash 

run_image_12_04: FORCE
	sudo docker run --privileged -t -i $(MOUNTDIRS) \
	-e DISPLAY=$$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
	$(IMG) /bin/bash 



#	sudo docker run -t -i -v $(LOCALDIR):/srv $(IMG) /bin/bash -c '$(CREATE_USER_COMMAND) bash'

FORCE:
