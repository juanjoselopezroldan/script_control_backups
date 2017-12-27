#!/bin/bash
prueba=$( mariadb -u root -p'root' -e 'select Name, Level, JobStatus, RealEndTime, (JobBytes/1024)/1024 from bacula.Job where RealEndTime in (select max(RealEndTime) from bacula.Job group by Name) and type="B" group by Name;')
echo $prueba
