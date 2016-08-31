 def run( sql )
    begin
      db = PG.connect({ dbname: 'library', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
 end