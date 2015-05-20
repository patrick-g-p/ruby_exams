class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :categories, :slug, :string
    add_column :exams, :slug, :string
  end
end
