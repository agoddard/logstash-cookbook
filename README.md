Description
===========

Configures logstash cluster - shipper nodes, message brokers, indexers, index hosts and a web host

Requirements
============

java, elasticsearch, rabbitmq


Platform
--------

Tested on:

* Ubuntu 10.04


Recipes
========

Shipper
-------

Collects logs from sources definied in attributes (currently limited to files, or syslog messages), ships these to the broker.

Broker
-------
Runs AMQP (RabbitMQ)

Indexer
-------
Collects logs from Broker, and inserts these into index (elasticsearch)

Index
-----
Runs Elasticsearch


Web
----
Exposes the logstash Web UI, connected to the Index's elasticsearch instance.



Resources and Providers
=======================


Attributes
==========



* `logstash['directory']` - Directory to install logstash into. Defaults to '/opt/logstash'
* `logstash['broker_role']` - the name of the role that's used to configure Broker nodes. Defaults to 'logstash-broker'
* `logstash['index_role']` - the name of the role that's used to configure Index nodes. defaults to 'logstash-index'
* `logstash['url']` - URL to download logstash. 
* `logstash['version']` - version of logstash to download
* `logstash['checksum']` = 'checksum of the logstash download'

* `logstash['grok']['url']` = 'URL to download grok'
* `logstash['grok']['version']` - 'grok version'
* `logstash['grok']['checksum']` - 'grok checksum'

* `logstash['syslog_server']` - whether or not this (shipper) host should listen for syslog messages. Default is false
* `logstash['syslog']['debug']` - whether or not to enable debugging on the syslog input. Defaults to false
* `logstash['syslog']['listen']` - Interface(s) to listen for syslog messages. Defaults to '0.0.0.0'
* `logstash['syslog']['port']` - Port for syslog to listen on (TCP and UDP). Defaults to 514 
* `logstash['syslog']['type']` - logstash input type, for filters. Defaults to 'syslog'


Usage
=====

The logstash cluster must have at least one shipper, broker, indexer and index node. These roles can all exist on a single server, or all on separate servers. Optionally, you can add a web ui node using the web recipe.

On nodes you want to collect logs from,

    include_recipe "logstash::shipper"

This will install a logstash instance which will tail files defined in the node's logstash['files'] array. If the node's syslog_server attribute is set to 'true', the node will also listen for syslog messages.

To setup a broker node,

    include_recipe "logstash::shipper"

To setup an indexer node,

    include_recipe "logstash::shipper"

The indexer will connect to the broker host, fetch logs from the broker's queue and add them to elasticsearch



