EXTRA-SERVICES := bind9 bitwarden calibre cloudflare-ddns dashboard postgres ethminer homeassistant hoppscotch jellyfin kms lms mariadb mysql-root mysql-user netdata nextcloud nextcloud_admin_password nginx ofelia photoprism picard react_ultimate_resume redis smtp transmission watchtower yacht
EXTRA-COMPOSE-FILES := $(shell find . -name "docker-compose@*.y*ml")

include .makefiles/.makefiles/common.mk
include .makefiles/.makefiles/git.mk
include .makefiles/.makefiles/docker.mk

COMPOSE-DEFAULT-PRESET = $(COMPOSE-ALL-PRESET)

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
