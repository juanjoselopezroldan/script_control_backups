#!/bin/bash
grafana1=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
grafana2=$( echo $grafana1 | cut -d " " -f 6-11)
echo $grafana2

mickey1=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
mickey3=$( echo $mickey1 | cut -d " " -f 6-11)

minnie1=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
minnie3=$( echo $minnie1 | cut -d " " -f 6-11)

donald1=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
donald3=$( echo $donald1 | cut -d " " -f 6-11)

#conexion con postgresql : psql -h 172.22.200.110  -U juanjose.lopez -W -d db_backup -c 'select * from backups;'
