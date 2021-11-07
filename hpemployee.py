import psycopg2
import config


def exeQuery(sqlString):
    con = psycopg2.connect(database=config.database, user=config.user, password=config.password, host=config.host, port=config.port)
    cur = con.cursor()
    cur.execute (sqlString)
    dataset = cur.fetchall()
    con.close()
    return dataset
