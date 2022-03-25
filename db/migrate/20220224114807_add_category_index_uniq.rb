class AddCategoryIndexUniq < ActiveRecord::Migration[5.2]
  def change
    def change
      add_index :categories, [:title], unique: true
    end
  end
end
