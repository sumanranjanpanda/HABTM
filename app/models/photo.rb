class Photo < ActiveRecord::Base
belongs_to :album
has_attached_file :image,
 :styles => {
    :thumb=> "100x100#",
    :small  => "180x180>",
    :medium => "250x250>",
    :large =>   "300x300>" 
  }
end
