import psycopg2

hostname = 'localhost'
database = 'sample_db'
username = 'postgres'
pwd = 'complexpassword'
port_id = 5432

conn = None
cur = None

try:
    conn = psycopg2.connect(
                host = hostname,
                dbname = database,
                user = username,
                password = pwd,
                port = port_id)

    cur = conn.cursor()

    insert_script = '''
INSERT INTO aliens VALUES ('1','Mars','1804-09-27');
INSERT INTO aliens VALUES ('2','Ego','2049-01-27');
INSERT INTO aliens VALUES ('3','Etheria','1819-05-27');
INSERT INTO aliens VALUES ('4','LV-426','2049-04-27');
INSERT INTO aliens VALUES ('5','Gallifrey','2019-12-27');
INSERT INTO aliens VALUES ('6','Krypton','2014-10-27');
INSERT INTO aliens VALUES ('7','Hell','1666-10-27');
INSERT INTO aliens VALUES ('8','Arda','1844-02-27');
INSERT INTO aliens VALUES ('9','Asgard','2015-04-27');
INSERT INTO aliens VALUES ('10','Solaris','1819-07-27');
INSERT INTO aliens VALUES ('11','Apokolips','1366-06-27');
INSERT INTO aliens VALUES ('12','Aiur','1819-03-27');
INSERT INTO aliens VALUES ('13','Cybertron','1974-01-27');
INSERT INTO aliens VALUES ('14','Zerus','0214-12-12');
                    '''
    cur.execute(insert_script)
    conn.commit()

    cur.execute('SELECT * FROM aliens ORDER BY id;')
    for record in cur.fetchall():
        print(record)

except Exception as error:
    print(error)

finally:
    if cur is not None:
        cur.close()
    if conn is not None:
        conn.close()
