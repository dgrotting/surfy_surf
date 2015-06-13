get '/' do
  "Hello"
  if current_user
    redirect '/welcome'
  else
    redirect '/signin'
  end
end

get '/welcome' do
  #Login to display favorites as well as have a link to click surf spots
end

get '/signin' do
  erb :signin
end


post '/signin' do
  @user = User.where(email: params[:email]).first if params[:email]
  if @user && @user.password_hash == params[:password_hash]
    session[:user_id] = @user.id
    redirect to '/welcome'
  else
    @errors = 'Your login info was incorrect! Please try again!'
    erb :signin
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  if params[:user][:password_hash] == params[:password_hash_verify]
    @user = User.new(params[:user])
    #set a session now that they are logged in
    if @user.save
      session[:user_id] = @user.id
      redirect '/welcome'
    end
  end
  @error = "Sorry! Your passwords do not match."
  erb :signup
end
