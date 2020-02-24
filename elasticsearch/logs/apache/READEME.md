
# Apache ActiveMQ logs

The apache module parses access and error logs created by the Apache HTTP server, to get we use the filebeat


#### Prerequisite

- [Create the network](../README.md)
- [Run elasticsearch and kibana](../ELASTICSEARCH_KIBANA.md)

#### Update filebeat.yml with activeMQ module

```yml
filebeat.config:
  modules:
    path: ${path.config}/modules.d/*.yml
    reload.enabled: false

- module: apache
  access:
    enabled: true
    var.paths: ["/path/to/log/apache/access.log*"]
  error:
    enabled: true
    var.paths: ["/path/to/log/apache/error.log*"]
    
setup.template.name: "filebeat"
setup.template.pattern: "filebeat-*"
setup.template.overwrite: false
setup.template.settings:
  index.number_of_shards: 1
  index.number_of_replicas: 1
setup.dashboards.enabled: true

output.elasticsearch:
  hosts: ['elasticsearch:9200']
  protocol: "http"
setup.kibana:
  host: "http://kibana:5601"
  protocol: "http"
xpack.monitoring.enabled: true
```

#### Run filebeat

[RUN Filebeat](../../filebeat/README.md)

####  Default Dashboard 

Goto Dashboard --> Serach for the Apache 

OR

[Apache Dashboard](http://kibana:5601/app/kibana#/dashboard/Filebeat-Apache-Dashboard-ecs)

