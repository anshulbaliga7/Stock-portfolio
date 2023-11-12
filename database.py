import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Anshul28!",
    database="portfolio"
)
c = mydb.cursor()


def get_tables_list():
    c.execute("SHOW TABLES")
    data = c.fetchall()
    return [i[0] for i in data]


def get_col_list(table_name):
    c.execute('SHOW COLUMNS FROM {}'.format(table_name))
    data = c.fetchall()
    return [i[0] for i in data]


def add_data(table_name, data):
    col_names = ",".join(data.keys())
    placeholders = ",".join(["%s"] * len(data))
    
    query = f"INSERT INTO {table_name} ({col_names}) VALUES ({placeholders})"
    values = tuple(data.values())

    c.execute(query, values)
    mydb.commit()


def get_data(table_name):
    c.execute(f"SELECT * FROM {table_name}")
    data = c.fetchall()
    return data


def delete_data(table_name, df):
    for each_id in df:
        c.execute(f"DELETE FROM {table_name} WHERE {df.name}='{each_id}'")
    mydb.commit()


def get_row(table_name, df):
    c.execute(f"SELECT * FROM {table_name} WHERE {df.name}='{df[0]}'")
    data = c.fetchall()
    return data


def get_column(table_name, col_name):
    c.execute(f"SELECT {col_name} FROM {table_name}")
    data = c.fetchall()
    return [i[0] for i in data]


def update_data(table_name, inp_keyval, id_col_name, id_col_val):
    col_val = ""
    for k in inp_keyval:
        col_val += k + " = " + inp_keyval[k] + ","
    col_val = col_val[:-1]

    c.execute(f"UPDATE {table_name} SET {col_val} WHERE {id_col_name}='{id_col_val}'")
    mydb.commit()


def exec_custom_query(query):
    c.execute(query)
    data = c.fetchall()
    mydb.commit()
    return data
