repository=telegraf

.PHONY: deploy remove logs

deploy:
	mkdir -p /var/docker/${repository}/data
	mkdir -p /var/docker/${repository}/conf
	cp telegraf.conf /var/docker/telegraf/conf/telegraf.conf
	docker stack deploy -c stack.yml ${repository}

remove:
	docker stack rm ${repository}

logs:
	docker logs $$(docker ps --filter name=$(repository) -q)
