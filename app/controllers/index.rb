# HOME PAGE
get '/' do
  erb :index
end

# ABOUT PAGE
get '/about' do
  erb :'pages/about'
end