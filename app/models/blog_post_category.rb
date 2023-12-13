class BlogPostCategory < ApplicationRecord
  belongs_to :blogpost
  belongs_to :category
end
