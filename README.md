# script_control_backups
Script realizado en bash que se encarga de controlar el historial de las copias de seguridad consultando a la base de datos de bacula (mariadb) y registrandolo en una segunda base de datos que se consultara de forma resumida dicho registro de las copias a traves de un panel web ajeno a este repositorio.
El funcionamiento del script es bastante basico consulta la informacion en una base de datos para registrarlo en otra que estara almacenando esta informacion de diferentes usuarios y se consulta de forma conjunta en un panel web.
