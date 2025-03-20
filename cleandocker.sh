#bin/bash
# shellcheck disable=SC2046
#docker-compose down
#docker rm -f $(docker ps -a -q)
#docker rmi $(docker images -a -q)
#docker volume rm $(docker volume ls -q)
#remove all container except oracle container and recreate them (for test)
docker ps -aq | grep -v $(docker ps -aqf name=oracle) | xargs docker rm -f
