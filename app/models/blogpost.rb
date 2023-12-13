class Blogpost < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :content
  has_many :blog_post_categories, class_name: "BlogPostCategory"
  has_many :categories, through: :blog_post_categories
  validates :title, presence: true
  validates :content, presence: true


  scope :sorted, ->{ order(arel_table[:published_at].desc.nulls_first).order(updated_at: :desc)}
  scope :draft, -> { where(published_at: nil)}
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end

