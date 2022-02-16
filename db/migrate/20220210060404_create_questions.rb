class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.belongs_to :questions, :test, index: true, foreign_key: true

      t.timestamps
    end
  end
end
