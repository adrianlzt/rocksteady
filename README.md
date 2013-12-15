rocksteady
==========

Testing [rocksteady](https://code.google.com/p/rocksteady/) monitoring solution

Rocksteady lleva desde enero de 2011 sin desarrollo.

Para terminar de instalar quedaba importar el esquema de la base de datos, bajar el código fuente y ejecutar.


### Requisitos:
 - vagrant
 - vagrant-lxc: ``vagrant plugin install vagrant-lxc``
 - bsdtar: ``apt-get install bsdtar``
 - librarian-puppet: ``gem install librarian-puppet``

### Arrancar entorno:
```
librarian-puppet install
vagrant up --provider=lxc --provision
```

[Acceder a graphite](http://localhost:8080)
