class CreateDesireds < ActiveRecord::Migration[6.0]
  def change
    create_table :desireds do |t|
      t.string :imdbid
      t.string :name
      t.text :description
      t.integer :score
      t.string :image
      t.text :comment
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
