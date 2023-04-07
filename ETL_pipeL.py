from sqlalchemy import create_engine
import psycopg2
import sqlalchemy as sa
import pyodbc
import pandas as pd
import os

#get password from environmnet var
pwd = os.environ['PGPASS']
uid = os.environ['PGUID']
#sql db details
driver = "{SQL Server Native Client 11.0}"
server = "DESKTOP-B3L51SQ"
database = "AdventureWorksDW2019;"


#extract data from sql server
def extract():
    try:
        src_conn = pyodbc.connect('DRIVER=' + driver + ';SERVER=' + server + '\SQLEXPRESS' + ';DATABASE=' + database + ';UID=' + uid + ';PWD=' + pwd)
        src_cursor = src_conn.cursor()
        # execute query
        src_cursor.execute(""" select  t.name as table_name
        from sys.tables t where t.name in ('Cms_db') """)
        src_table = src_cursor.fetchall()
        print(src_table)
        # for tbl in src_tables:
            #query and load save data to dataframe

        sql_query = pd.read_sql_query('''select * FROM AdventureWorksDW2019.dbo.Cms_db''', src_conn)
        df = pd.DataFrame(sql_query)
        df.to_csv(r'C:\Users\jamie\OneDrive\Documents\Databases\exportedcms_data.csv', index=False)
        print(df)
        loadings(df)
    except Exception as e:
        print("Data extract error: " + str(e))
    finally:
        src_conn.close()

#load data to postgres
def loadings(df):
    try:
        rows_imported = 0
        engine = create_engine('postgresql+psycopg2://{uid}:{pwd}@localhost:5432/AdventureWorks')
        print("create engine")
        #print(f'importing rows {rows_imported} to {rows_imported + len(df)}... for table {tbl}')
        # save df to postgres
        df.to_sql(df, engine, if_exists='replace', index=False)
        rows_imported += len(df)
        # add elapsed time to final print out
        print("Data imported successful")
    except Exception as e:
        print("Data load error: " + str(e))

def naic_query():


try:
    #call extract function
    extract()
except Exception as e:
    print("Error while extracting data: " + str(e))



    # query select from


    # repeat etl backwards backto cms


