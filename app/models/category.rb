class Category < ApplicationRecord
  has_many :blog_post_categories, class_name: "BlogPostCategory"
  has_many :blogposts, through: :blog_post_categories
end
