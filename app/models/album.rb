class Album < ActiveRecord::Base
has_many :photos, :dependent=>:destroy
belongs_to :user

def photo_attributes=(photo_attributes)
   photo_attributes.each do |attributes|
   photos.build(attributes)
	end
end
end
