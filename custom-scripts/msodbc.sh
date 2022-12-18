curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo curl "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list" > /etc/apt/sources.list.d/mssql-release.list

sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools17
# optional: for unixODBC development headers
sudo apt-get install -y unixodbc-dev


