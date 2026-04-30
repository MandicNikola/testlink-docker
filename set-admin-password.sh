#!/bin/sh
set -e

# Hash za admin lozinku
# ovo je hash za lozinku "admin"
ADMIN_HASH='$2y$10$qWzr3Xdf2XguLlab6SryuOatojW/5OyD8xlb35pcxrehvjL3QAbpG'

echo "Waiting for MariaDB and TestLink users table..."

echo "Waiting for MariaDB to be ready..."
until mariadb \
  -h "$DB_HOST" \
  -u "$MARIADB_USER" \
  -p"$MARIADB_ROOT_PASSWORD" \
  "$DB_NAME" \
  -e "SELECT 1;" > /dev/null 2>&1
do
  echo "MariaDB not ready yet..."
  sleep 5
done



until mariadb \
  -h "$DB_HOST" \
  -u "$MARIADB_USER" \
  -p"$MARIADB_ROOT_PASSWORD" \
  "$DB_NAME" \
  -e "SELECT 1 FROM bitnami_testlink.users LIMIT 1;" > /dev/null 2>&1
do
  echo "users table not ready yet..."
  sleep 5
done

echo "users table exists. Waiting for admin user..."

until mariadb \
  -h "$DB_HOST" \
  -u "$MARIADB_USER" \
  -p"$MARIADB_ROOT_PASSWORD" \
  "$DB_NAME" \
  -N -B \
  -e "SELECT COUNT(*) FROM bitnami_testlink.users WHERE login = 'admin';" | grep -q "1"
do
  echo "admin user not ready yet..."
  sleep 5
done

echo "Admin user exists. Updating password..."

mariadb \
  -h "$DB_HOST" \
  -u "$MARIADB_USER" \
  -p"$MARIADB_ROOT_PASSWORD" \
  "$DB_NAME" \
  -e "
UPDATE bitnami_testlink.users
SET password = '${ADMIN_HASH}'
WHERE login = 'admin';
"

echo "Password updated. Verifying..."

mariadb \
  -h "$DB_HOST" \
  -u "$MARIADB_USER" \
  -p"$MARIADB_ROOT_PASSWORD" \
  "$DB_NAME" \
  -e "
SELECT login, password
FROM bitnami_testlink.users
WHERE login = 'admin';
"

echo "Done."