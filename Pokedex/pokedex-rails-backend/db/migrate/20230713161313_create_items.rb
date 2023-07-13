class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.bigint "pokemon_id", null: false
      t.string "name", null: false
      t.integer "price", null: false
      t.integer "happiness", null: false
      t.string "image_url", null: false
      t.index ["pokemon_id"], name: "index_items_on_pokemon_id"

      t.timestamps
    end
  end
end
