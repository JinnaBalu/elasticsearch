# APM Server


Application Performance Monitoring (APM) collects in-depth performance metrics and errors from inside your application. It allows you to monitor the performance of thousands of applications in real time. [Learn more..](https://www.elastic.co/guide/en/apm/get-started/7.5/index.html)

### Run APM Server 

*Prerequisite*

- [Create the network](./README.md)
- [Run elasticsearch and kibana](ELASTICSEARCH_KIBANA.md)


#### Step 1: Create the docker-compose.yml for running APM Server as container


https://raw.githubusercontent.com/JinnaBalu/platform-obs/elasticsearch/master/docker-compose.yml?token=ACZ5APK45Q42JE3D2BTOOZS6KQTOM

#### Step 2: Edit the apm-server.yml 

https://raw.githubusercontent.com/JinnaBalu/platform-obs/elasticsearch/master/docker-compose.yml?token=ACZ5APK45Q42JE3D2BTOOZS6KQTOM

#### Step 3: Start the APM server

```bash
docker-compose -f apm/docker-compose.yml up -d
```

APM Server : [http://localhost:8200/](http://localhost:8200/)

*Expected Output:*

```json
{
  "build_date": "2019-12-16T20:57:59Z",
  "build_sha": "348d8d83c3c823b64fc0692be607b1a5a8fac775",
  "version": "7.5.1"
}
```

### Step 4: Check with the status of the APM

```bash
docker ps -a

docker logs <CONTAINER_NAME> or <CONTAINER_ID>

ex: docker logs apm or docker logs 1srr3w82b

```

### Configure the APM Agents

- We can configure the Agents like `java`, `RUM(JS)`, `NODE.js`, `Django`, `Flask`, `Ruby on Rails`, `Rack`, `Go`, `.Net`, to send the logs to the elasticsearch,
- We can configure multiple agents with the Agent name to identify the errors and performance logs to the APM server. 
- We can View the logs in Kibana in APM tab.