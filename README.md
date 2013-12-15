rocksteady
==========

Testing rocksteady monitoring solution
https://code.google.com/p/rocksteady/

Arrancar entorno:
```
librarian-puppet install
vagrant up --provider=lxc --provision
```

La idea es tener un sistema con collectd + graphite.

Luego meter entre medias RabbitMQ.

Y por último conectar rocksteady con RabbitMQ


Conexión collectd -> RabbitMQ

https://collectd.org/wiki/index.php/Plugin:AMQP

http://www.canopsis.org/2013/02/collectd-graphite/




La configuración buena:

carbon.conf:
```
ENABLE_AMQP = True
AMQP_VERBOSE = True
AMQP_HOST = 127.0.0.1
AMQP_PORT = 5672
AMQP_VHOST = graphite
AMQP_USER = graphite
AMQP_PASSWORD = graphite
AMQP_EXCHANGE = metrics
AMQP_METRIC_NAME_IN_BODY = True
```

collectd/conf.d/amqp.conf:
```
LoadPlugin amqp
<Plugin amqp>
 <Publish "graphite">
   Host "127.0.0.1"
   Port "5672"
   VHost "graphite"
   User "graphite"
   Password "graphite"
   Format "Graphite"
   Exchange "metrics"
   ExchangeType "amq.topic"
   Persistent true
   GraphitePrefix "collectd."
   GraphiteEscapeChar "_"
 </Publish>
</Plugin>
```
