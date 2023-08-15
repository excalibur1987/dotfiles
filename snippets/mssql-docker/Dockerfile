FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Gr16Om87As13

# Copy your custom hosts file into the image
COPY docker-hosts /tmp/docker-hosts

# Append the contents of the custom hosts file to /etc/hosts
RUN cat /tmp/docker-hosts >> /etc/hosts

# Create directories to mount host data
RUN mkdir -p /var/opt/mssql/data/databases
RUN mkdir -p /var/opt/mssql/backup

# Expose port 1433
EXPOSE 1433

# Start SQL Server
CMD [ "/opt/mssql/bin/sqlservr" ]
