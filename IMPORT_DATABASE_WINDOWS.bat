@echo off
setlocal
set "MYSQL_EXE="

if exist "C:\xampp\mysql\bin\mysql.exe" set "MYSQL_EXE=C:\xampp\mysql\bin\mysql.exe"
if exist "D:\xampp\mysql\bin\mysql.exe" set "MYSQL_EXE=D:\xampp\mysql\bin\mysql.exe"

if not defined MYSQL_EXE (
  echo MySQL client was not found in C:\xampp or D:\xampp.
  echo Start MySQL in XAMPP, then import cafe_management_system_db.sql manually using phpMyAdmin.
  pause
  exit /b 1
)

echo Using: %MYSQL_EXE%
echo Importing Cafe Management System database...
"%MYSQL_EXE%" -u root < "%~dp0cafe_management_system_db.sql"

if errorlevel 1 (
  echo.
  echo Database import failed.
  echo If your root account has a password, import the SQL file through phpMyAdmin or run mysql with -p.
  pause
  exit /b 1
)

echo.
echo Database imported successfully: cafe_management_system_db
echo Login username: admin
echo Login password: 123
pause
