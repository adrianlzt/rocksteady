rocksteady
==========

Testing [rocksteady](https://code.google.com/p/rocksteady/) monitoring solution


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
