class ChangeDataTypeForContent < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :content, :string
  end
end
