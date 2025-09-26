# A Containerized Hello World Java deployment with Docker 

a very simple rest-api-hello-world java application with Spring Boot and Maven, containerized with dockerfile, ready to build and deployed with a very simple way.

## Create deployable jar file
```
Run mvn clean install

Note : It will compile and run unit/surefire tests
``` 
## How to Build
```
docker build -t hello-world-java-docker .
```  

## How to Run
```
docker run -d -p 8080:8080 hello-world-java-docker
```
## Run Tests
```
Activate python venv : .\venv\Scripts\activate
Run pip install -r requirements.txt

robot robot/api
robot robot/ui
```
## Verify your application
```
http://localhost:8080/
```
## Reference
```
https://edwin.baculsoft.com/2020/07/building-containerized-images-on-openshift-4-and-push-the-result-to-third-party-image-registry/
```