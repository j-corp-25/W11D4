class CreatePokeMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :poke_moves do |t|
      t.bigint "pokemon_id", null: false
      t.bigint "move_id", null: false
      t.index ["move_id"], name: "index_poke_moves_on_move_id"
      t.index ["pokemon_id", "move_id"], name: "index_poke_moves_on_pokemon_id_and_move_id", unique: true

      t.timestamps
    end
  end
end
