alias images='docker images'
alias images-names='docker images --format "{{.Repository}}:{{.Tag}}"'
alias images-pull='docker images --format "{{.Repository}}:{{.Tag}}" | grep -v ":<none>"  | grep -v "/" | xargs -n1 docker pull'
alias images-clean='docker system prune -f'

alias containers-clean='docker rm $(docker ps -qa --filter status=exited)'
alias containers-reset='docker rm -f $(docker ps -qa)'

alias de='docker exec -it'
alias di='docker images'
alias dp='docker ps -a'
alias dt='docker logs --tail 10 -f'
alias dv='docker volume ls'
alias dx='docker run -it --rm'

alias dc='docker-compose'
alias up='docker-compose up --detach --remove-orphans'
alias down='docker-compose down'
alias logs='docker-compose logs --tail 10 -f'
alias dcx='docker-compose run --rm'
alias upp='up --force-recreate'

alias docker-host-shell="screen ${HOME}/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty"

alias dx-pma='docker run -d --rm -e PMA_HOST=docker.for.mac.host.internal -p 8033:80 --name pma phpmyadmin/phpmyadmin; open http://localhost:8033/;'
alias dx-c9='docker run -d --rm -p 8009:80 -v $(pwd):/workspace --name cloud9 kdelfour/cloud9-docker'
alias dx-redis='docker run -d --rm -p 6379:6379 -v /usr/local/etc/redis.conf:/usr/local/etc/redis/redis.conf --name redis redis'
