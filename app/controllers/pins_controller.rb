#INDEX pins
get '/pins' do
  @pins = Pin.all 
  erb :'pins/index'
end

#NEW pin
get '/pins/new' do
  erb :'pins/new'
end

#CREATE pin
post '/pins' do
  @pin = Pin.new(params[:pin]) 
  if @pin.save 
    redirect '/pins' 
  else
    erb :'pins/new' 
  end
end

#SHOW pin
get '/pins/:id' do
  @pin = Pin.find(params[:id]) 
  erb :'pins/show' 
end

#EDIT pin
get '/pins/:id/edit' do
  @pin = Pin.find(params[:id]) 
  erb :'pins/edit'
end

#UPDATE pin
put '/pins/:id' do
  @pin = Pin.find(params[:id])
  @pin.assign_attributes(params[:pin])
  if @pin.save 
    redirect '/pins'
  else
    erb :'pins/edit' 
  end
end

#DESTROY pin
delete '/pins/:id' do
  @pin = Pin.find(params[:id]) 
  @pin.destroy 
  redirect '/pins' 
end
