class DropUserAnswers < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_answers
  end
end
