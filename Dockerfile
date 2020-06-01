#Based on an ubuntu image that presents phpinfo so we can check ENV vars with ease
FROM jasoncallaway/phpinfo:latest

#Install the AWS CLI, used to reach secrets manager
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
apt-get update && \
apt-get install unzip jq -y && \
unzip awscliv2.zip && \
./aws/install

#Add EntryPoint script
COPY entrypoint.sh /

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
