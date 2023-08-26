# %%
import os
import pandas as pd

# %%

def sql_scripter (path, outfile,outpath,sep):
    type_dic = {
        "int64" : "INT",
        "float64": "FLOAT",
        "object": "VARCHAR (255)",
    }

    fileslist = os.listdir(path = path)
    
    # loop to create the query:
    query = '--lets Start \n'
    for file in fileslist:
        if file.startswith("."):
            continue
        table = pd.read_csv(path+file,sep=sep)
    
        tablename = file.split(".")[0]
        
        # check which columns are unique and can be used as primary key 
        first_unique_column = None
        for i in range(table.shape[1]):
            if table.iloc[:,i].value_counts().shape[0] == table.shape[0]:
                first_unique_column = i
                break
        
        #create query
        query = query + f'DROP TABLE IF EXISTS {tablename};\nCREATE TABLE {tablename}(\n'
        col_i = 0
        primary_key_set = False
        for column, type in zip(table.columns,table.dtypes):
            if column in ['picture', 'photo']:
                lines = f'\t{column} TEXT' 
            else:   
                lines = f'\t{column} {type_dic[str(type)]}'
            if col_i == first_unique_column:
                    lines +=  ' PRIMARY KEY'
                    primary_key_set = True
            lines += ',\n'
            query = query + lines
            col_i += 1
        query = query[0:-2]
        if not primary_key_set:
            prim_key_combined = ',\n\tPRIMARY KEY ('+','.join([f'{col }'for col in table.columns[:2]])+ ')'
            query = query + prim_key_combined

        query = query + f"\n);\n\copy {tablename} FROM '{outpath+file}' DELIMITER ',' CSV HEADER;\n\n"

    with open(file=f'{outfile}',mode='w') as file:
        file.write(query)

# %%

IN_PATH = './database/data/'
OUT_PATH = '/data/'
OUTFILE = './database/data_model.sql'
SEP=","
sql_scripter(IN_PATH,OUTFILE,OUT_PATH, SEP)

# %%
