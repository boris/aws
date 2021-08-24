.PHONY: run terraform
.DEFAULT_GOAL := help

run: ## Run docker-compose with all the modules enabled
	docker-compose up -d

stop: ## Stop all the services started by docker compose (make run)
	docker-compose stop

terraform: ## Run terraform for the service defined on `SRV`
ifdef SRV
	cd $(SRV) ; terraform plan
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
