class Pokemon < ActiveRecord::Base
  belongs_to :trainer

  def weakness_type
    if pokemon_type == "Electric"
      "Ground"
    elsif pokemon_type == "Water"
      "Electric"
    elsif pokemon_type == "Fire"
      "Water"
    end
  end
end
