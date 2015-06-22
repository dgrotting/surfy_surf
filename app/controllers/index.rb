get '/' do
  if current_user
    redirect '/welcome'
  else
    redirect '/signin'
  end
end

get '/welcome' do
  @spots = Favorite.where(user_id: current_user.id)
  # @spot_names = @spots.
  erb :welcome
end

get '/signin' do
  erb :signin
end

get '/spots/search' do
  spotname = params[:spotname]
  @spots = Spot.where("name like ?", "%#{spotname}%")
  erb(:_spot_search_results, layout: false, locals: {spots: @spots})
  # erb :spots
end

get '/spots/:id' do
  @spot = Spot.find(params[:id])
  @comments = Comment.where(spot_id: params[:id])
  erb :spot_report
end

post '/spots/:id' do
  @comment = Comment.create(body: params[:body], spot_id: params[:id], user_id: current_user.id)
  p @comment
  erb(:_new_comment, layout: false, locals: {comment: @comment})
  # redirect "/spots/#{params[:id]}"
end

get '/spots' do
  @spots = Spot.all
  erb :spots
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

get '/users/:id' do
  @user = User.find(params[:id])
  @favorites = User.find(params[:id]).favorites

  erb :user
end

delete '/users/:id' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id/favorites' do
  @favorites = current_user.favorites
  erb :favorites
end
