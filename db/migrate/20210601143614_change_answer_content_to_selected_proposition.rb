class ChangeAnswerContentToSelectedProposition < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :answer_content, :selected_proposition
  end
end
