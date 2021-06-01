class AddSecondPropositionToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :second_proposition, :string
  end
end
