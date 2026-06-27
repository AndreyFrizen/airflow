#!/bin/bash
mkdir -p certs && cd certs

echo "Генерация Root CA..."
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
  -keyout ca.key -out ca.crt -subj "/CN=Local-ETL-CA"

echo "Генерация сертификата для PostgreSQL..."
openssl req -new -nodes -newkey rsa:2048 \
  -keyout postgres.key -out postgres.csr -subj "/CN=postgres"
openssl x509 -req -days 3650 -in postgres.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out postgres.crt
chmod 600 postgres.key

echo "Генерация сертификата для OpenLDAP..."
openssl req -new -nodes -newkey rsa:2048 \
  -keyout ldap.key -out ldap.csr -subj "/CN=ldap"
openssl x509 -req -days 3650 -in ldap.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ldap.crt

echo "Сертификаты успешно созданы!"
