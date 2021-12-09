EXTRA-SERVICES := bind9 bitwarden calibre cloudflare-ddns dashboard db ethminer ferdi homeassistant hoppscotch jellyfin kms lms mariadb mysql-root mysql-user netdata nextcloud nextcloud_admin_password nginx ofelia photoprism picard postgres_password react_ultimate_resume redis smtp transmission transmission_password uptime-kuma watchtower yacht
EXTRA-COMPOSE-FILES := $(shell find . -name "docker-compose@*.y*ml")

include .makefiles/.makefiles/common.mk
include .makefiles/.makefiles/git.mk
include .makefiles/.makefiles/docker.mk

.PHONY: clean
clean: ## Launch all the clean targets
	@$(MAKE) clean-dist-files
	@$(MAKE) clean-docker

.PHONY: nuke-force
nuke-force:
	@-$(MAKE) fix-ownership
	@-$(MAKE) clean
	@-$(MAKE) nuke-docker
	@-$(MAKE) nuke-git

.PHONY: nuke
nuke: ## Launch all the nuke targets
	@read -p "Type 'yes' to continue: " response; \
	[ "$$response" = "yes" ] && make nuke-force || echo "Nuke aborted"

.PHONY: up
up: secrets
	@$(COMPOSE-ALL-PRESET) up -d