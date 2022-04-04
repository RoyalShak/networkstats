#!/bin/bash
getpid=$(ps -eo pid)
pid=$(ps -eo pid |awk {'print $1'} | tail -n +2 )
echo "PID","Processname","process Create TIme","Local Address&port","Remote Address&port" >> net.csv
for i in $pid
do
  port=$(netstat -ano -p tcp |grep $i |grep tcp | grep 'ESTABLISHED' |awk {'print $4'} |tail -1)
  process_time=$(ps -o etime= -p "$i") 
 process_name=$(ps -p $i -o comm=)
 port2=$(netstat -ano -p tcp |grep $i |grep tcp | grep 'ESTABLISHED' |awk {'print $5'} |tail -1)
  echo "$i,$process_name,$process_time,$port,$port2"  >> net.csv
done