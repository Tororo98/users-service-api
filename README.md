# Automatically create and destroy the environment

## Compile and create the environment
bash build.sh create

## Destroy the environment (images + containers)
bash build.sh destroy

# Create the environment manually

## Compile the java projects
1. cd java-gateway
2. ./gradlew build -x test  (or gradle build -x test)
3. cd ..
4. cd java-users-service-api
5. ./gradlew build -x test  (or gradle build -x test)

## Create the environment
1. Remove all volumes, containers and images of the project <br/>
    1.1 sudo docker volume ls <br/>
    1.2 sudo docker volume rm PUT_HERE_THE_ID (of the lists of IDs) <br/>
2. sudo docker-compose up -d
3. sudo docker ps -a
4. sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' MySQLServiceDB

## Tests
3. cd java-gateway
4. python3 manual_tests.py

## Destroy all environment
1. sudo docker-compose down --rmi all