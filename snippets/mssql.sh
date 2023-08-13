read -p "What SQL version to install:" VER

read -p "Container Name:" NAME

read -p "Hostname:" HOST


stty -echo
read -p "SA Password:" PASS; echo
stty echo

sudo docker pull mcr.microsoft.com/mssql/server:$VER-latest

sudo docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=$PASS" \
   -p 1433:1433 --name $NAME --hostname $HOST \
   -d \
   mcr.microsoft.com/mssql/server:$VER-latest