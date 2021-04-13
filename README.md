# Rails6 docker image

## Usage

`cd rails6`

`% docker-compose up -d`

`% docker-compose exec db bash`

`$ mysql -u root`

`mysql> select User,Host,plugin from mysql.user;`

| User             | Host      | plugin                |
| :--------------- | :-------- | :-------------------- |
| root             | %         | caching_sha2_password |
| mysql.infoschema | localhost | caching_sha2_password |
| mysql.session    | localhost | caching_sha2_password |
| mysql.sys        | localhost | caching_sha2_password |
| root             | localhost | caching_sha2_password |

`ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';`

| User             | Host      | plugin                |
| :--------------- | :-------- | :-------------------- |
| root             | %         | mysql_native_password |
| mysql.infoschema | localhost | caching_sha2_password |
| mysql.session    | localhost | caching_sha2_password |
| mysql.sys        | localhost | caching_sha2_password |
| root             | localhost | caching_sha2_password |

`mysql> select User,Host,plugin from mysql.user;`

`% docker-compose exec web bundle exec rails db:prepare`
