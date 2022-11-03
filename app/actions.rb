get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    redirect to('/login')
  else
    erb(:signup)
  end
end

get '/pokemons' do
  @pokemons = Pokemon.order(pokedex_number: :asc)

  erb(:"pokemons/index")
end

get '/trainers' do
  @trainers = Trainer.order(name: :asc)

  erb(:"trainers/index")
end

get '/trainers/new' do
  erb(:"trainers/new")
end

# Handle form submission
post '/trainers' do
  new_trainer = Trainer.new(name: params["trainer_name"], image_url: params["image_url"])
  if new_trainer.save
    redirect "/trainers"
  else
    "Trainer is invalid"
  end
end

get '/pick_fav_pokemon' do
  erb(:fav_pokemon_form)
end

post '/fav_pokemon' do
  fav_pokemon_from_form = params[:fav_pokemon]
  session[:fav_pokemon] = fav_pokemon_from_form

  "Fav pokemon set to #{fav_pokemon}"
end

get '/login' do    # when a GET request comes into /login
  erb(:login)      # render app/views/login.erb
end

post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)  

  if user && user.password == password
    session[:user_id] = user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

get '/finstagram_posts/new' do
  @finstagram_post = FinstagramPost.new
  erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
  photo_url = params[:photo_url]

  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end

get '/finstagram_posts/:id' do
  @finstagram_post = FinstagramPost.find(params[:id])   # find the finstagram post with the ID from the URL
  erb(:"finstagram_posts/show")               # render app/views/finstagram_posts/show.erb
end

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def fav_pokemon
    session[:fav_pokemon]
  end
end

get "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])

  erb(:"pokemons/show")
end

get "/trainers/:id" do
  @trainer = Trainer.find(params[:id])

  erb(:"trainers/show")
end
