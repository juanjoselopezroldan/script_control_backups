#!/bin/bash
grafana1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
grafana_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
grafana2=$( echo $grafana1 | cut -d " " -f 7)
grafana3=$( echo $grafana_fecha | cut -d " " -f 2)

if [ $grafana2 == $grafana3 ]; then
    echo "true"
else
    echo "false"
fi

mickey1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey2=$( echo $mickey1 | cut -d " " -f 6-11)

minnie1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie2=$( echo $minnie1 | cut -d " " -f 6-11)

donald1=$( mariadb -u root -p'root' -e 'select Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald_fecha=$( mariadb -u root -p'root' -e 'select max(RealEndTime) from bacula.Job where RealEndTime not in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald2=$( echo $donald1 | cut -d " " -f 6-11)

#conexion con postgresql : psql -h 172.22.200.110  -U juanjose.lopez -W -d db_backup -c 'select * from backups;'
