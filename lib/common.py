'''
Created on 2 mai 2014

@author: ClementTurbelin
'''

import csv
import sys

geo_levels = ['country', 'nuts1', 'nuts2', 'nuts3']

pop_geo_levels = ['country', 'nuts1', 'nuts2']

def log(msg):
    print >> sys.stderr, msg

def get_upper_level(level):
    i = geo_levels.index(level)
    if(i == 0):
        return None
    return geo_levels[i - 1] 

def get_upper_levels(level):
    i = geo_levels.index(level)
    if(i == 0):
        return None
    return geo_levels[:i] 

    
def get_geo_field_name(level):
    if level == 'country':
        return level
    else:
        return 'code_' + level

def read_file(fn):
    try:
        log("Opening %s" % fn)
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
    """
      Transform R based named (with .) to DB fields name 
    """
    column = column.replace('.', '_')
    return column

def pgvalue(v, quote=True):
    return "'" + v + "'"

def create_insert_query(fn, columns, table_name, accept_null=None, append=None, debug=False):
    data = read_file(fn)
    if data:
        tuples = []
        for row in data:
            if debug:
                log(row)
            values = []
            for col in columns:
                x = row[col]
                if accept_null is not None and col in accept_null and x == "NA":
                    x = "NULL"
                else:
                    x = x.replace("'","''")
                    x = "'" + x + "'" 
                values.append(x) 
            if append is not None:
                for x in append.values():
                    values.append("'" + x + "'")
            
            values = '(' +  ','.join(values) + ')'  
            tuples.append(values)
        fields =  map(make_field_name, columns)
        if append is not None:
            fields.append(append.keys())
        query = 'INSERT INTO '+ table_name +' ("' + '","'.join(fields) +'") VALUES ' +"\n" + ",\n".join(tuples) + ";\n\n"
        return query
    return None
