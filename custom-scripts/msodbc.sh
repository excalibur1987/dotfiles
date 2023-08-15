sudo apt remove unixodbc unixodbc-dev odbcinst odbcinst1debian2 libodbc1 msodbcsql17 mssql-tools

find /var/cache -name \*.deb -exec rm {} +

sudo rm /etc/apt/sources.list.d/mssql-release.list
sudo rm /etc/apt/sources.list.d/msprod.list
sudo apt update

sudo apt install unixodbc unixodbc-dev odbcinst odbcinst1debian2 libodbc1

sudo apt-mark hold odbcinst1debian2 odbc-postgresql python3-pyodbc libodbc1 unixodbc unixodbc-dev odbcinst odbcinst1debian2

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo curl "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list" > /etc/apt/sources.list.d/mssql-release.list

sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
sudo apt-get install -y mssql-tools unixodbc unixodbc-dev