# HOME PAGE
get '/' do
  erb :index
end

# ABOUT PAGE
get '/about' do
  erb :'pages/about'
end

# SPOTTED PAGE
get '/spotted' do
  erb :'pages/spotted'
end