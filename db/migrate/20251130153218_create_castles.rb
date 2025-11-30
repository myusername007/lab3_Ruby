class CreateCastles < ActiveRecord::Migration[7.1]
  def change
    create_table :castles do |t|
      t.string :name
      t.string :region
      t.text :description
      t.integer :built_year
      t.string :image_url

      t.timestamps
    end
  end
end
