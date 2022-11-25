#!/bin/bash
port=8888
serverPort=8080


while getopts "tskhrp:c:" option;  
do
 case $option in
 h)
        echo "-h help"
        echo "-s    start instance"
        echo "-k    kill instance"
        echo "-r    restart instance"
        echo "-p    proxy port"
        echo "-c    server port "
        echo "-t    test by gin ,must behind proxy port or server port if they are set !" 
  ;;
 k)
   echo "kill the instance"
  ;;
 r)
   echo "restart the instance"
  ;;
 s)
    go run main.go 
  ;;
 p)
   port=$OPTARG
   echo "port: "$port
  ;;
 c)
   serverPort=$OPTARG
   echo "serverPort: "$serverPort
  ;;
 t)
    gin -p $port -a $serverPort -b gin-bin --all run
  ;;
 :)
  echo "option -$OPTARG needs an argument"
 ;;
 *)
  echo "use -h for help"
 ;;
esac
done


