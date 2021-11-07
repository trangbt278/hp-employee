Pull the repository from github
..\sql\DBQuery.sql - to query data related to employees
..\sql\DBSchema.sql - schema of the database
..\sql\DBScript.sql - data and schema of the database. You can use this to restore the database
..\sql\hp-employee-ERD.pgerd - the ERD exported from PostgreSQL
..\sql\hp-employee-ERD.png - the screenshot of ERD
..\config.py - to config database info to execute the project
..\hpemployee.py - to handle database connection and execution and this is imported to the jupyter notebook to execute data analysis
..\EmployeeSalaryAnalysis.ipynb - analyze employee data

Reload the DB:
1. Add the path of psql execution file of postgres to environment path. This path normally is "C:\Program Files\PostgreSQL\14\bin". Guidelines to add environment path: https://www.java.com/en/download/help/path.html
2. Create a database in pgAdmin 
3. Open Termnial, Commandline Prompt or Gitbash and run below to restore the database
psql -U user_name -d database_name -f "path to file\sql\DBScript.sql"

Run the project
1. Update database info in the ..\config.py
2. Open ..\EmployeeSalaryAnalysis.ipynb and run the project








