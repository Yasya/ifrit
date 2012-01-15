class Node < ActiveRecord::Base
  validates :body, :picture, :presence => true
  has_many :comments, :dependent => :destroy
  belongs_to :board
  mount_uploader :picture, PictureUploader
  
  def to_param
    "#{number}"
  end
end
