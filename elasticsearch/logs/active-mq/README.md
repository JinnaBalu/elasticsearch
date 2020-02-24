
# ActiveMQ logs

Application and audit logs, to get we use the filebeat


#### Prerequisite

- [Create the network](../README.md)
- [Run elasticsearch and kibana](../ELASTICSEARCH_KIBANA.md)

#### Update filebeat.yml with activeMQ module

```yml
filebeat.config:
  modules:
    path: ${path.config}/modules.d/*.yml
    reload.enabled: false

- module: activemq
  audit:
    enabled: true
    var.paths: ["/path/to/log/activemq/data/audit.log*"]
  log:
    enabled: true
    var.paths: ["/path/to/log/activemq/data/activemq.log*"]
    
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

Goto Dashboard --> Serach for the "Filebeat ActiveMQ"

