# USERS NEW
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

# USERS CREATE
post '/users' do
  if params[:password_confirmation] == params[:user][:password]
    @user = User.new(params[:user])

    if @user.save
      session[:id] = @user.id
      redirect "/"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end

  else
    @errors = ["Passwords do not match!"]
    erb :'users/new'
  end
end