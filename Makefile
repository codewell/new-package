PROJECT_PATH       = $(shell pwd)
PROJECT_APP        = $(PROJECT_PATH)/src/main.sh

APP_NAME           = npkg
APP_INSTALL_DIR  ?= $(HOME)/bin
APP_PATH           = $(APP_INSTALL_DIR)/$(APP_NAME)

define FILE_CONTENT
#!/usr/bin/env bash

$(PROJECT_APP) "$$@"
endef

export FILE_CONTENT

# This will grep the double comment marker (##) and map all targets to the
# comment which will just print the comment next to each target for documenting
# purposes.
help: ## Show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install the todo application
	@echo "Installing '$(APP_NAME)' in $(APP_INSTALL_DIR)"
	@echo "$$FILE_CONTENT" > $(APP_PATH)
	@chmod 755 $(APP_PATH)

uninstall: ## Uninstall the todo application
	@echo "Uninstalling '$(APP_NAME)' from $(APP_INSTALL_DIR)"
	@rm -f $(APP_PATH)

.PHONY: help install uninstall