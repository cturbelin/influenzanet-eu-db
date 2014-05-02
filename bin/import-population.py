'''
Created on 30 avr. 2014

@author: ClementTurbelin

Create SQL script from population data

'''
from lib.common import pop_geo_levels, read_file, get_geo_field_name, log
import argparse
import csv

parser = argparse.ArgumentParser(description='Generate SQL to import population file from csv data file')

parser.add_argument('year', metavar='Y', type=int, nargs=1, help='year to import')

args = parser.parse_args()

year = int(args.year[0])

log("Importing year " + str(year))


def make_field_name(column):
  """
  Transform R based named (with .) to DB fields name 
  """
  column = column.replace('.', '_')
  return column

def create_query(fn, columns, table_name):
    data = read_file(fn)
    if data:
        values = []
        for row in data:
            v = '('
            for col in columns:
               x = row[col]
               if col == "age.max" and x == "NA":
                   x = "NULL"
               else:
                   x = "'" + x + "'" 
               v += x + "," 
            v += str(year) +")"  
            values.append(v)
        fields =  map(make_field_name, columns)
        query = 'INSERT INTO '+ table_name +' ("' + '","'.join(fields) +'", "year") VALUES ' +"\n" + ",\n".join(values) + ";"
        return query
    return None

all_ok = True
queries = ''
for level in pop_geo_levels:
    log("level " + level)
    
    code_level = get_geo_field_name(level)
    add_country = level != "country" 
    
    # Global level table
    columns = ['all', 'male', 'female', 'year.ref', code_level]
    if add_country:
        columns.append('country')
    fn = "data/population/%d_pop_%s.csv" % (year, level)
    table_name = 'pop_%s' % level
    log(" > importing " + fn)
    query = create_query(fn, columns, table_name)
    if query:
        log(" OK")
        query = 'DELETE FROM ' + table_name +' where "year"=' + str(year)+";\n\n" + query
        queries += query + "\n\n"
    else:
        log("<ERROR>")
        all_ok = False
    
    # age5 level table
    columns = ['age.min','age.max', 'all', 'male', 'female', 'year.ref', code_level]
    if add_country:
        columns.append('country')
    fn = "data/population/%d_pop_%s_age5.csv" % (year, level)
    table_name = 'pop_age5_%s' % level
    log(" > importing " + fn)
    query = create_query(fn, columns, table_name)
    if query:
        log(" OK")
        query = 'DELETE FROM ' + table_name +' where "year"=' + str(year)+ ";\n\n" + query
        queries += query + "\n\n"
    else:
        log("<ERROR>")
        all_ok = False
        
if all_ok:
    print queries
        