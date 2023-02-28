heroku pg:backups capture -a planet-support-center

curl -o psc-main-latest.dump `heroku pg:backups public-url -a planet-support-center`

pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d psc-main psc-main-latest.dump