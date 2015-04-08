class Post < ActiveRecord::Base
	retina!
	belongs_to :user
	has_many :comments, dependent: :destroy
	
	has_attached_file :main_image, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => " ",
	:retina => { :quality => 80 }
	validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/
end
