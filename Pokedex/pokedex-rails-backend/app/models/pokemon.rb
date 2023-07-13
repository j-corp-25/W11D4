# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer
#  name       :string
#  attack     :integer
#  defense    :integer
#  poke_type  :string
#  image_url  :string
#  captured   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
  TYPES = [
    'fire',
    'electric',
    'normal',
    'ghost',
    'psychic',
    'water',
    'bug',
    'dragon',
    'grass',
    'fighting',
    'ice',
    'flying',
    'poison',
    'ground',
    'rock',
    'steel'
  ].sort.freeze

  validates :name, :poke_type, :image_url, presence: true
  validates :number, numericality: { only_integer: true, greater_than: 0 }
  validates :attack, :defense, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  validates :captured, inclusion: [true, false], message: "Captured must be true or false"

  validates :name, length: { in: 3..255 }, uniqueness: { message: "'%{value}' is already in use" }
  
  validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }

  has_many :items,
    primary_key: :id,
    foreign_key: :pokemon_id,
    class_name: :Item,
    dependent: :destroy

  has_many :poke_moves,
    primary_key: :id,
    foreign_key: :pokemon_id,
    class_name: :PokeMove

  has_many :moves,
    through: :poke_moves,
    source: :move

end
