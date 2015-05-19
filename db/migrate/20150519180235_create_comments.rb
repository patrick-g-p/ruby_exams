class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :body, :text
      t.column :user_id, :integer
      t.column :exam_id, :integer

      t.timestamps
    end
  end
end
