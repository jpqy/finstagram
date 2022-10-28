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
    "User #{username} saved!"
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

helpers do
  def fav_pokemon
    session[:fav_pokemon]
  end
end

