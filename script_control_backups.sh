#!/bin/bash
grafana=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
prueba1=$( echo $grafana | cut -d " " -f 6-11)

mickey=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
prueba2=$( echo $mickey | cut -d " " -f 6-11)

minnie=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
prueba3=$( echo $minnie | cut -d " " -f 6-11)

donald=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
prueba4=$( echo $donald | cut -d " " -f 6-11)
