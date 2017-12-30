#!/bin/bash
mickey1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey2=$( echo $mickey1 | cut -d " " -f 7 | cut -d "-" -f 3)
mickey3=$( date | cut -d " " -f 3)
mickey_fecha=$( echo $mickey1 | cut -d " " -f 7-8)
mickey_estado=$( echo $mickey1 | cut -d " " -f 6)
mickey_tipo=$( echo $mickey1 | cut -d " " -f 5)
mickey_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $mickey2
echo $mickey3
echo $mickey_fecha
echo $mickey_estado
echo $mickey_tipo
echo $mickey_tamano

if [ $mickey2 == $mickey3 ]; then
  echo "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','$mickey_tipo', '$mickey_fecha con tamano de $mickey_tamano', '$mickey_estado', 'Automatica')"
else
  echo "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','null', 'No se ha realizado la copia, por favor realice una comprobacion', 'F', 'Erronea')"
fi

minnie1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie2=$( echo $minnie1 | cut -d " " -f 7 | cut -d "-" -f 3)
minnie3=$( date | cut -d " " -f 3)
minnie_fecha=$( echo $minnie1 | cut -d " " -f 7-8)
minnie_estado=$( echo $minnie1 | cut -d " " -f 6)
minnie_tipo=$( echo $mickey1 | cut -d " " -f 5)
minnie_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $minnie2
echo $minnie3
echo $minnie_fecha
echo $minnie_estado
echo $minnie_tipo
echo $minnie_tamano
if [ $minnie2 == $minnie3 ]; then
  echo "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','$minnie_tipo', '$minnie_fecha con tamano de $minnie_tamano', '$minnie_estado', 'Automatica')"
else
  echo "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','null', 'No se ha realizado la copia, por favor realice una comprobacion', 'F', 'Erronea')"
fi



donald1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald2=$( echo $donald1 | cut -d " " -f 7 | cut -d "-" -f 3)
donald3=$( date | cut -d " " -f 3)
donald_fecha=$( echo $donald1 | cut -d " " -f 7-8)
donald_estado=$( echo $donald1 | cut -d " " -f 6)
donald_tipo=$( echo $mickey1 | cut -d " " -f 5)
donald_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $donald2
echo $donald3
echo $donald_estado
echo $donald_tipo
echo $donald_tamano

if [ $donald2 != $donald3 ]; then
  echo "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','$mickey_tipo', '$mickey2 con tamano de $mickey_tamano', '$mickey_estado', 'Automatica')"
else
  echo "inset into backups (backup_user, backup_host, backup_label, backup_description, backup_status, backup_mode) values ('juanjose.lopez', '172.22.200.78','null', 'No se ha realizado la copia, por favor realice una comprobacion', 'F', 'Erronea')"
fi


#conexion con postgresql : psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c 'select * from backups;'
