class SetDefaultRoleInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :role, 'user'
  end
end
