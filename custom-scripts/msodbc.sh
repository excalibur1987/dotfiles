version=$(($(lsb_release -r -s)))
version=${version%.*}

if [ "$version" -gt "20" ]; then
    sudo apt-get install odbcinst
    sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/21.10/prod impish main" | sudo tee /etc/apt/sources.list.d/mssql-release.list
else
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo curl "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list" > /etc/apt/sources.list.d/mssql-release.list
fi
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
sudo apt-get install -y mssql-tools unixodbc unixodbc-dev
