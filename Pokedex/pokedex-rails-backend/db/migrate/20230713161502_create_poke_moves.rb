class CreatePokeMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :poke_moves do |t|
      t.references :pokemon, null: false, unique: true, foreign_key: { to_table: :pokemons}
      t.references :move, null: false, unique: true, foreign_key: { to_table: :moves}
      t.index [:pokemon_id, :move_id], unique: true
      t.timestamps
    end
  end
end
