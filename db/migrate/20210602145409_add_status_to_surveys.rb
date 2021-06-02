class AddStatusToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :status, :string, default: "open"
  end
end
