require('pg')

def run_sql(sql)
  db = PG.connect( {dbname:'music_library', host:'localhost'} )
  result = db.exec( sql )
  db.close()
  return result
end
