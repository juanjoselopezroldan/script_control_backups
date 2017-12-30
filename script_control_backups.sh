#!/bin/bash
grafana1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
grafana_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
grafana2=$( echo $grafana1 | cut -d " " -f 7)
grafana3=$( echo $grafana_fecha | cut -d " " -f 2)
 echo $grafana2
 echo $grafana3
#if [ $grafana2 == $grafana3 ]; then
#    echo "true"
#else
#    echo "false"
#fi

mickey1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey2=$( echo $mickey1 | cut -d " " -f 7)
mickey3=$( echo $mickey_fecha | cut -d " " -f 2)
echo $mickey2
echo $mickey3

minnie1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie2=$( echo $minnie1 | cut -d " " -f 7)
minnie3=$( echo $minnie_fecha | cut -d " " -f 2)
echo $minnie2
echo $minnie3

donald1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald2=$( echo $donald1 | cut -d " " -f 7)
donald3=$( echo $donald_fecha | cut -d " " -f 2)
echo $donald2
echo $donald3

#conexion con postgresql : psql -h 172.22.200.110  -U juanjose.lopez -d db_backup -c 'select * from backups;'
