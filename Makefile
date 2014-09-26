
IMG=tr61/sinatra:v2

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

make_image: FORCE
	sudo docker build -t="$(IMG)" .

LOCALDIR=$(shell pwd)

run_image: FORCE
	sudo docker run -t -i -v $(LOCALDIR):/srv $(IMG) /bin/bash -c '$(CREATE_USER_COMMAND) bash'

FORCE:
