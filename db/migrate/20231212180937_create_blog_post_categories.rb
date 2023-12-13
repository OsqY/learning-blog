class CreateBlogPostCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_post_categories do |t|
      t.references :blogpost, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
