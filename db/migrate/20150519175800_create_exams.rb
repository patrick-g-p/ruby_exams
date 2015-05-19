class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.column :name, :string
      t.column :doc_url, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
