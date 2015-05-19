class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :body, :text
      t.column :exam_id, :integer

      t.timestamps
    end
  end
end
