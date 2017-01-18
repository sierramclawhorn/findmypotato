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

#CREATE pin
get '/spotted/search' do
  @pin = Pin.new(lat: params[:lat], lng: params[:lng]) 
  @pin.user_id = current_user.id
  if @pin.save && request.xhr?
    status 200
  else
    erb :'pages/spotted' 
  end
end