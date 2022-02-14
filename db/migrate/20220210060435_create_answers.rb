class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct, default: false
      t.belongs_to :question, index: true, foreign_key: true

      t.timestamps
    end
  end
end
