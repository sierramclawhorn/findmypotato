# HOME PAGE
get '/' do
  erb :index
end

# ABOUT PAGE
get '/about' do
  erb :'pages/about'
end

# SPOTTED PAGE
# get '/spotted' do
#   @mykey = ENV['MAPS_API_KEY']
#   erb :'pages/spotted'
# end
# in pins_controller