class ChangeColumnTypeToUsers < ActiveRecord::Migration[8.1]
  def change
    change_column :users, :introduction, :text
  end
end
