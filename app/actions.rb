def humanized_time_ago(minute_num)
  if minute_num >= 60
    "#{minute_num / 60} hours ago"
  else
    "#{minute_num} minutes ago"
  end
end

get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)

  erb(:index)
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
