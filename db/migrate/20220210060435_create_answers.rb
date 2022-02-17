class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, default: false
      t.belongs_to :answers, :question, index: true, foreign_key: true

      t.timestamps
    end
  end
end
