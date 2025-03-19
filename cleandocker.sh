#bin/bash
# shellcheck disable=SC2046
#docker-compose down
docker ps -aq | grep -v $(docker ps -aqf name=oracle) | xargs docker rm -f
#docker rm -f $(docker ps -a -q)
#docker rmi $(docker images -a -q)
#docker volume rm $(docker volume ls -q)
