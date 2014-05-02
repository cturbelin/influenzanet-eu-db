'''
Created on 2 mai 2014

@author: ClementTurbelin
'''
from lib.common import geo_levels, read_file, create_insert_query, get_geo_field_name, get_upper_levels, log

country = None

queries = ''
all_ok = True

columns = map(get_geo_field_name, geo_levels)
fn = 'data/nuts/geo_levels.csv' 
queries += 'DELETE FROM geo_levels;' + "\n\n"
query = create_insert_query(fn, columns, 'geo_levels' , debug=False)

queries += query

for level in geo_levels:
    log(level)
    fn = 'data/nuts/geo_%s.csv' % level
    #data = read_file(fn)
    code_level = get_geo_field_name(level)
    columns = [code_level, 'title' ]
    upper = get_upper_levels(level)
    if upper:
        upper = map(get_geo_field_name, upper)
        for u in upper:
            columns.append(u)
        if level != 'country' and not 'country' in upper:
            columns.append('country')
    table = 'geo_' + level
    query = create_insert_query(fn, columns, table, debug=False)
    if query:
        queries += 'DELETE FROM ' + table + ';' + "\n\n"
        queries += query
    else:
        all_ok = False

if all_ok:
    log("Generating SQL...")
    print queries