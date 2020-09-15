MYSQL_DATABASE=projectx
MYSQL_USER=projectx
MYSQL_PASSWORD=password

.DEFAULT_GOAL := help
.PHONY: help
help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' ${MAKEFILE_LIST} | sort | awk 'BEGIN {FS = ":.*?## "}; { \
		printf "\033[36m%-20s\033[0m %s\n", $$1, $$2 \
	}'

dev: ## docker containerを立ち上げる
	docker-compose build
	docker-compose up
login_mysql: ## mysqlに入る
	docker-compose exec mysql mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE)
login_redis: ## redisに入る
	docker-compose exec redis redis-cli
