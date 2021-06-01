class AddFirstPropositionToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :first_proposition, :string
  end
end
