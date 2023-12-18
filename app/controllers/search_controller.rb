class SearchController < ApplicationController
  def search_blogpost
    @get_blogpost = user_signed_in? ?
                      Blogpost.where("title LIKE ?", "%#{params[:title]}%").sorted :
                      Blogpost.where("title LIKE ?", "%#{params[:title]}%").published.sorted
    puts @get_blogpost
  end
end
