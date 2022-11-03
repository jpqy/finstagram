class Pokemon < ActiveRecord::Base
  belongs_to :trainer

  def weakness_type
    if pokemon_type == "Electric"
      "Ground"
    elsif pokemon_type == "Water"
      "Electric"
    elsif pokemon_type == "Fire" || pokemon_type == "Rock"
      "Water"
    end
  end
end
