docker-compose build
docker-compose push

ssh oravm "
mkdir ~/discordBots/${PWD##*/}
mkdir ~/discordBots/${PWD##*/}/config
"

scp docker-compose.deploy.yml oravm:discordBots/${PWD##*/}
scp -r .env oravm:discordBots/${PWD##*/}
scp -r config oravm:discordBots/${PWD##*/}


ssh oravm "
mkdir ~/discordBots/${PWD##*/}
cd ~/discordBots/${PWD##*/}
docker-compose -f docker-compose.deploy.yml pull
docker-compose -f docker-compose.deploy.yml up -d
"
