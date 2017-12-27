#!/bin/bash
grafana=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="grafana" group by Name;')
echo $grafana
mickey=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="mickey" group by Name;')
echo $mickey
minnie=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="minnie" group by Name;')
echo $minnie
donald=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" and Name="donald" group by Name;')
echo $donald
