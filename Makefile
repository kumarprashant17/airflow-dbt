CONTAINER_NAME=dbt_dags

stopenv:
	@docker-compose -f docker-compose.yml down --remove-orphans

startenv: stopenv
	@docker-compose -f docker-compose.yml up --build -d
	@docker exec ${CONTAINER_NAME} /waitforwebserver.sh

generate_dbt_manifest:
	@docker exec ${CONTAINER_NAME} dbt ls --profiles-dir=dbt/config/local --project-dir=dbt/ > /dev/null

run-bash:
	@docker exec -it ${CONTAINER_NAME} /bin/bash

unittest:
	@docker exec ${CONTAINER_NAME} python3 -m pytest -s --disable-warnings tests/unittest

test:
	@docker exec ${CONTAINER_NAME} python3 -m pytest -s --disable-warnings tests/unittest

dbt-lint:
	@docker exec ${CONTAINER_NAME} sqlfluff lint

dbt-fmt:
	@docker exec ${CONTAINER_NAME} sqlfluff fix -f