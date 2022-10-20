class CreatePokemonTables < ActiveRecord::Migration

  def change
    create_table :trainers do |t|
      t.string :name
    end

    create_table :pokemons do |t|
      t.string :name
      t.string :pokemon_type
      t.integer :pokedex_number
      t.references :trainer
    end

  end

end
