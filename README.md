rocksteady
==========

Testing rocksteady monitoring solution
https://code.google.com/p/rocksteady/


La idea es tener un sistema con collectd + graphite.
Luego meter entre medias RabbitMQ.
Y por último conectar rocksteady con RabbitMQ


Conexión collectd -> RabbitMQ
https://collectd.org/wiki/index.php/Plugin:AMQP
http://www.canopsis.org/2013/02/collectd-graphite/


Collectd enviando información a rabbitmq. Lo veo con el trace y el tcpdump.
Parece que el collectd envía la información pero no crea las queues.
Tal vez el graphite se conecta directamente al exchange?

Configuro a mano los parámetros de amqp para graphite. Habrá que modificar el módulo para poder configurar amqp con puppet.
Graphite necesita el paquete "apt-get install python-txamqp" para poder usar amqp

TODO: enviar nuevo módulo amqp para el módulo de collectd (ya lo tengo hecho en puppet/modules/collectd


La configuración buena:
carbon.conf:
ENABLE_AMQP = True
AMQP_VERBOSE = True
AMQP_HOST = 127.0.0.1
AMQP_PORT = 5672
AMQP_VHOST = graphite
AMQP_USER = graphite
AMQP_PASSWORD = graphite
AMQP_EXCHANGE = metrics
AMQP_METRIC_NAME_IN_BODY = True


collectd/conf.d/amqp.conf:
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
