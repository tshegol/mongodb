# /bin/bash
# Launch an EC2 instance
docker-machine create \
--driver amazonec2 \
--amazonec2-open-port 27017 ql
# Activate the instance
eval $(docker-machine env ql)
# Create container 1
docker run \
-d \
-p 27017:27017 \
--name ql-db \
-v ~/dataMongo:/data/db mongo \
--auth \
mongod
# Connect to your DB
mongo $(docker-machine ip ql):27017
# IN THE MONGO SHELL create a super admin
db.createUser(
  {
    user: "admin",
    pwd: "password",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ],
    passwordDigestor : "server"
  }
)
# QUIT THE MONGO SHELL
# Delete the container and recreate one with auth
docker stop ql-db
docker rm ql-db
# Run the final container
docker run \
-d \
-p 27017:27017 \
--name ql-db \
-v ~/dataMongo:/data/db mongo \
--auth \
mongod
