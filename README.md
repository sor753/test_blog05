# Rails6 docker image

## Usage

`% docker-compose up -d`
`% docekr-compose exec db bash`
`$ mysql -u root`
`mysql> select User,Host,plugin from mysql.user;`
`ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';`
`mysql> select User,Host,plugin from mysql.user;`
