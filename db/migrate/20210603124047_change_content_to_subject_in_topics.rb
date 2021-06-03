class ChangeContentToSubjectInTopics < ActiveRecord::Migration[6.0]
  def change
    rename_column :topics, :content, :subject
  end
end
