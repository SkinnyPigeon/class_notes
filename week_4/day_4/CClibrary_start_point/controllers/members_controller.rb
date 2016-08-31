require_relative('../models/member')

#index
get '/members' do
  @members = Member.all()
  erb(:'members/index')
end

#new
get '/members/new' do
  erb(:'members/new')
end

#show
get '/members/:id' do
end

#edit
get '/members/:id/edit' do
end

#create
post '/members' do
  @member = Member.new(params)
  @member.save
  redirect to('/members')
end

#update
post '/members/:id' do
end

#delete
delete '/members' do
end