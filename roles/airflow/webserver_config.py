import os

from flask_appbuilder.security.manager import AUTH_LDAP

AUTH_TYPE = AUTH_LDAP
AUTH_USER_REGISTRATION = True
AUTH_USER_REGISTRATION_ROLE = "Admin"

AUTH_LDAP_SERVER = "ldap://ldap2:389"
AUTH_LDAP_USE_TLS = False
AUTH_LDAP_SEARCH = "ou=users,dc=example,dc=org"
AUTH_LDAP_UID_FIELD = "uid"

AUTH_LDAP_BIND_USER = "cn=admin,dc=example,dc=org"
AUTH_LDAP_BIND_PASSWORD = "admin"
AUTH_LDAP_BIND_FIRST = False  # Попробуем False, как более стабильный вариант для Bind

# Маппинг полей
AUTH_LDAP_FIRSTNAME_FIELD = "cn"
AUTH_LDAP_LASTNAME_FIELD = "sn"
AUTH_LDAP_EMAIL_FIELD = "mail"

# --- ЭТО КРИТИЧЕСКИЕ НАСТРОЙКИ ---
# Если эта настройка True, FAB может требовать подтверждения почты, что вызывает сбой
AUTH_USER_REGISTRATION_ROLE = "Admin"

# 2. Указываем структуру DN, чтобы Airflow не искал, а сразу "билдил"
# Если uid=admin_user,ou=users,dc=example,dc=org — это путь к объекту,
# то вот шаблон:
AUTH_LDAP_USER_DN_FORMAT = "uid=%s,ou=users,dc=example,dc=org"
