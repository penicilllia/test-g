class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def self.up
    add_column :tests, :author, :integer
    add_column :users, :created_tests, :string
  end

  def self.down
    remove_column :tests, :author
    remove_column :users, :created_tests
  end
end
