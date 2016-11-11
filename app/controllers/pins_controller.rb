# #INDEX pins
get '/spotted' do
  @pins = Pin.all 
  if request.xhr?
    @pins.to_json
    p @pins.to_json
  else
    erb :'pages/spotted'
  end
end

# #NEW pin
# get '/spotted' do
#   erb :'pins/new'
# end

#CREATE pin
get '/spotted/search' do
  p "*" *50
  p params
  @pin = Pin.new(lat: params[:lat], lng: params[:lng]) 
  @pin.user_id = current_user.id
  if @pin.save && request.xhr?
    status 200
    "liiiop"
  else
    erb :'pins/new' 
  end
end

# #SHOW pin
# get '/pins/:id' do
#   @pin = Pin.find(params[:id]) 
#   erb :'pins/show' 
# end

# #EDIT pin
# get '/pins/:id/edit' do
#   @pin = Pin.find(params[:id]) 
#   erb :'pins/edit'
# end

# #UPDATE pin
# put '/pins/:id' do
#   @pin = Pin.find(params[:id])
#   @pin.assign_attributes(params[:pin])
#   if @pin.save 
#     redirect '/pins'
#   else
#     erb :'pins/edit' 
#   end
# end

# #DESTROY pin
# delete '/pins/:id' do
#   @pin = Pin.find(params[:id]) 
#   @pin.destroy 
#   redirect '/pins' 
# end
