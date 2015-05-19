class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :username, :string
      t.column :password_digest, :string
      t.column :role, :string
      t.column :time_zone, :string

      t.timestamps
    end
  end
end
