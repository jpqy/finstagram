class AddImageUrlsToPokemonTables < ActiveRecord::Migration

  def change
    add_column :pokemons, :image_url, :string
    add_column :trainers, :image_url, :string
  end

end
