class Comment < ActiveRecord::Base
  validates :body, :presence => true
  mount_uploader :picture, PictureUploader
  belongs_to :node
  belongs_to :board

  #def to_param
  #  "#{number}"
  #end
end
