get '/artists' do
  #INDEX
  query = params[:search]
  @artists = Artist.all(query)
  erb ( :'artists/index' )
end

get '/artists/new' do
  #NEW
  erb( :'artists/new' )
end

post '/artists' do
  #CREATE
 @artist = Artist.new( params )
 @artist.save()
 redirect to('/artists')
end

get '/artists/:id' do
  #SHOW
  @artist = Artist.find( params[:id] )
  erb( :'artists/show' )
end

get '/artists/:id/edit' do
  #EDIT
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end

put '/artists/:id' do
  #UPDATE
 @artist = Artist.update( params )
 redirect to( "/artists/#{params[:id]}" )
end

delete '/artists/:id' do
  #DELETE
  Artist.destroy( params[:id] )
  redirect to('/artists')
end