while  [ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:9944)" != "400" ]; 
	do sleep 5; 
done
