class Post < ActiveRecord::Base
	belongs_to :user
  #PAPERCLIP IMAGE RELATED
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	def self.recent
  	Post.all[0..(Post.count-2)]
  end

	def next
	  Post.where("posts.id > ?", self.id).order("posts.id ASC").first
	end

	def previous
	  Post.where("posts.id < ?", self.id).order("posts.id DESC").last
	end
end
