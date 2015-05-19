class CreateExamCategories < ActiveRecord::Migration
  def change
    create_table :exam_categories do |t|
      t.column :exam_id, :integer
      t.column :category_id, :integer

      t.timestamps
    end
  end
end
