class Trainer < ActiveRecord::Base
  has_many :pokemons

  validates_presence_of :name, :image_url
  validates_uniqueness_of :name, :image_url
end
