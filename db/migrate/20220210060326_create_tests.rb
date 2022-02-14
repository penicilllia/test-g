class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, default: 1
      t.belongs_to :category, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
