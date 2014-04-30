'''
Created on 30 avr. 2014

@author: ClementTurbelin

Create SQL script from population data

'''
import argparse
import csv
geo_levels = ['nuts2','nuts1','country']

parser = argparse.ArgumentParser(description='Import population file')

parser.add_argument('year', metavar='Y', type=int, nargs=1, help='year to import')

args = parser.parse_args()

year = int(args.year[0])

print "Importing year " + str(year)

def read_file(fn):
    try:
        print "Opening %s" % fn
        f = open(fn, 'r')
        r = csv.DictReader(f, delimiter=',', quotechar='"')
        data = []
        for row in r:
            data.append(row)
        return data
    except IOError,e:
        print e
    return None

def make_field_name(column):
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
for level in geo_levels:
    print "level " + level
    
    if level != "country":
        code_level = 'code_'  + level
        add_country = True
    else:
        code_level = level
        add_country = False 
    
    # Global level table
    columns = ['all', 'male', 'female', 'year.ref', code_level]
    if add_country:
        columns.append('country')
    fn = "data/population/%d_pop_%s.csv" % (year, level)
    table_name = 'pop_%s' % level
    print " > importing " + fn,
    query = create_query(fn, columns, table_name)
    if query:
        print " OK"
        query = 'DELETE FROM ' + table_name +' where "year"=' + str(year)+";\n\n" + query
        queries += query + "\n\n"
    else:
        print "<ERROR>"
        all_ok = False
    # age5 level table
    columns = ['age.min','age.max', 'all', 'male', 'female', 'year.ref', code_level]
    if add_country:
        columns.append('country')
    fn = "data/population/%d_pop_%s_age5.csv" % (year, level)
    table_name = 'pop_age5_%s' % level
    print " > importing " + fn,
    query = create_query(fn, columns, table_name)
    if query:
        print " OK"
        query = 'DELETE FROM ' + table_name +' where "year"=' + str(year)+ ";\n\n" + query
        queries += query + "\n\n"
    else:
        print "<ERROR>"
        all_ok = False
        
if all_ok:
    output = open(str(year) + ".sql", "w+")
    output.write(queries)
    output.close()
        