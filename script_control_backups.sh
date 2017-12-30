#!/bin/bash

#Se consulta a la base de datos de bacula  y se obtiene los parametros necesarios para el registo de la copia y todo ello se guarda en una variable
mickey1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
#Se filtra la fecha de esa consulta realizada para comparar posteriormente
mickey2=$( echo $mickey1 | cut -d " " -f 7 | cut -d "-" -f 3)
#Se obtiene la fecha actual del sistema, filtrando el dia
mickey3=$( date | cut -d " " -f 3)
#Se filtra la fecha y hora para registrar dicha actividad
mickey_fecha=$( echo $mickey1 | cut -d " " -f 7-8)
#Se filtra la informacion de la consulta realizada para obtener el estado de la copia si ha sido correcto o no
mickey_estado=$( echo $mickey1 | cut -d " " -f 6)
#Se filta la informacion de la consulta realizada para obtener que tipo de copia se ha realizado si es completa, diferencial o incremental
mickey_tipo=$( echo $mickey1 | cut -d " " -f 5)
#Se filta la informacion de la consulta realizada para obtener el tamano de dicha copia
mickey_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $mickey2
echo $mickey3
echo $mickey_fecha
echo $mickey_estado
echo $mickey_tipo
echo $mickey_tamano

if [ $mickey2 == $mickey3 ]; then
  psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','$mickey_tipo', '$mickey_fecha con tamano de $mickey_tamano M', '$mickey_estado', 'Automatica');"
else
  echo "ERROR: La copia se seguridad de mickey no se ha realizado, por favor compruebe que ocurre." | mail -s "Error en Grafana con Bacula" jjlr1994@gmail.com
fi

minnie1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie2=$( echo $minnie1 | cut -d " " -f 7 | cut -d "-" -f 3)
minnie3=$( date | cut -d " " -f 3)
minnie_fecha=$( echo $minnie1 | cut -d " " -f 7-8)
minnie_estado=$( echo $minnie1 | cut -d " " -f 6)
minnie_tipo=$( echo $minnie1 | cut -d " " -f 5)
minnie_tamano=$( echo $minnie1 | cut -d " " -f 9)
echo $minnie2
echo $minnie3
echo $minnie_fecha
echo $minnie_estado
echo $minnie_tipo
echo $minnie_tamano
if [ $minnie2 == $minnie3 ]; then
  psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.102','$minnie_tipo', '$minnie_fecha con tamano de $minnie_tamano M', '$minnie_estado', 'Automatica');"
else
  echo "ERROR: La copia se seguridad de minnie no se ha realizado, por favor compruebe que ocurre." | mail -s "Error en Grafana con Bacula" jjlr1994@gmail.com
fi


donald1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald2=$( echo $donald1 | cut -d " " -f 7 | cut -d "-" -f 3)
donald3=$( date | cut -d " " -f 3)
donald_fecha=$( echo $donald1 | cut -d " " -f 7-8)
donald_estado=$( echo $donald1 | cut -d " " -f 6)
donald_tipo=$( echo $donald1 | cut -d " " -f 5)
donald_tamano=$( echo $donald1 | cut -d " " -f 9)
echo $donald2
echo $donald3
echo $donald_estado
echo $donald_tipo
echo $donald_tamano

if [ $donald2 == $donald3 ]; then
  psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.76','$donald_tipo', '$donald_fecha con tamano de $donald_tamano M', '$donald_estado', 'Automatica')"
else
  echo "ERROR: La copia se seguridad de donald no se ha realizado, por favor compruebe que ocurre." | mail -s "Error en Grafana con Bacula" jjlr1994@gmail.com
fi


#conexion con postgresql : psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c 'select * from backups;'
