class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :answer_content
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
