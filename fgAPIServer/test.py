#!/usr/bin/env python
import MySQLdb

db_host = 'localhost'
db_port = 3306
db_user = 'fgapiserver'
db_pass = 'fgapiserver_password'
db_name = 'fgapiserver'

rec_id='5'
rec_value='cinque'

db = MySQLdb.connect(
            host=db_host,
            user=db_user,
            passwd=db_pass,
            db=db_name,
            port=db_port)
cursor = db.cursor()
sql = ("insert into test values (%s, %s);")
sql_data = (rec_id, rec_value)
print sql % sql_data
cursor.execute(sql, sql_data)
print "Hit return ..."
r=raw_input()
if cursor is not None:
    cursor.close()
if db is not None:
    db.commit()
    db.close()


