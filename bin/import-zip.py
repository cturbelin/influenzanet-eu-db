'''
Created on 2 mai 2014

@author: ClementTurbelin
'''
from lib.common import geo_levels, read_file, create_insert_query, get_geo_field_name, get_upper_levels, log

import argparse

parser = argparse.ArgumentParser(description='Generate SQL to import zip')

parser.add_argument('file', nargs=1, help='file to import')

args = parser.parse_args()

fn = str(args.file[0])

log("Importing file " + fn)

data = read_file('data/zip/' + fn)

def create_levels(level, value):
    d = {}
    if level == 'nuts3':
        d['code_nuts3'] = value
        d['code_nuts2'] = value[0:4]
    if level == 'nuts2':
        d['code_nuts2'] = value
    n2 = d['code_nuts2']
    d['code_nuts1'] = n2[0:3]
    d['country'] = n2[0:2]
    return d

fields = None
zips = []
if data:
    fields = data[0].keys()
    level = None
    for f in fields:
        if f in geo_levels:
            level = f
            break
    if level is None:
        raise Error("Unknown level")
    queries = []
    columns = ['code_zip','country','code_nuts1','code_nuts2']
    if level == 'nuts3':
        columns.append('code_nuts3')
    line = 1
    for row in data:
        d = create_levels(level, row[level])
        zip = row['zip']
        if zip in zips:
            log('Duplicate zip "' + str(zip) +'", line ' + str(line))
            continue
        zips.append(zip)
        d['code_zip'] = zip
        query = []
        for col in columns:
            query.append("'" + d[col] + "'")
        query = '(' + ','.join(query) + ')' + "\n"
        queries.append(query)
        line = line + 1
        
    query = 'INSERT INTO geo_zip (' + ','.join(columns) + ') VALUES ' + "\n" + ','.join(queries) +' ;'
    
    print query
    