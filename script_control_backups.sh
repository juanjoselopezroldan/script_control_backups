#!/bin/bash
mickey1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey2=$( echo $mickey1 | cut -d " " -f 7)
mickey3=$( echo $mickey_fecha | cut -d " " -f 2)
mickey_estado=$( echo $mickey1 | cut -d " " -f 6)
mickey_tipo=$( echo $mickey1 | cut -d " " -f 5)
mickey_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $mickey2
echo $mickey3
echo $mickey_estado
echo $mickey_tipo
echo $mickey_tamano

#if [ $mickey2 != $mickey3 ]; then
#  echo "inset into backups values ('juanjose.lopez', '172.22.200.78','' )"
#else
#    echo "false"
#fi

minnie1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie2=$( echo $minnie1 | cut -d " " -f 7)
minnie3=$( echo $minnie_fecha | cut -d " " -f 2)
minnie_estado=$( echo $minnie1 | cut -d " " -f 6)
minnie_tipo=$( echo $mickey1 | cut -d " " -f 5)
minnie_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $minnie2
echo $minnie3
echo $minnie_estado
echo $minnie_tipo
echo $minnie_tamano
#if [ $minnie2 != $minnie3 ]; then
#    if
#else
#    echo "false"
#fi


donald1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald2=$( echo $donald1 | cut -d " " -f 7)
donald3=$( echo $donald_fecha | cut -d " " -f 2)
donald_estado=$( echo $donald1 | cut -d " " -f 6)
donald_tipo=$( echo $mickey1 | cut -d " " -f 5)
donald_tamano=$( echo $mickey1 | cut -d " " -f 9)
echo $donald2
echo $donald3
echo $donald_estado
echo $donald_tipo
echo $donald_tamano

#if [ $donald2 != $donald3 ]; then
#    echo "true"
#else
#    echo "false"
#fi

#conexion con postgresql : psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c 'select * from backups;'
