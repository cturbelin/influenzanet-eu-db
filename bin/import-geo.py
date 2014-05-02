'''
Created on 2 mai 2014

@author: ClementTurbelin
'''
from lib.common import geo_levels, read_file, create_insert_query, get_geo_field_name, get_upper_level

country = None

queries = ''
all_ok = True

columns = map(get_geo_field_name, geo_levels)
fn = 'data/nuts/geo_levels.csv' 

queries += 'DELETE FROM geo_levels;' + "\n\n"
query = create_insert_query(fn, columns, 'geo_levels' , debug=False)

queries += query

for level in geo_levels:
    print level
    fn = 'data/nuts/geo_%s.csv' % level
    #data = read_file(fn)
    code_level = get_geo_field_name(level)
    columns = [code_level, 'title' ]
    upper = get_upper_level(level)
    if upper:
        upper = get_geo_field_name(upper)
        columns.append(upper)
    if level != 'country' and upper != 'country':
        columns.append('country')
    table = 'geo_' + level
    query = create_insert_query(fn, columns, table, debug=False)
    if query:
        queries += 'DELETE FROM ' + table + ';' + "\n\n"
        queries += query
    else:
        all_ok = False

if all_ok:
    print "Generating SQL..."
    output = open("geo.sql", "w+")
    output.write(queries)
    output.close()
   