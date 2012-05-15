#require 'ftools'

class User < ActiveRecord::Base

#after_create :write_file
has_many :albums,:dependent=>:destroy
has_many :photos, :through => :albums
has_and_belongs_to_many :roles
validates_presence_of :name,:occupation,:gender,:age,:email,:mobile,:address,:username,:password
validates_uniqueness_of :email,:allow_blank=>true
validates_uniqueness_of :username,:allow_blank=>true
validates_format_of :email ,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:allow_blank=>true
validates_confirmation_of :password
has_attached_file :photo, :styles=>{:small=>"300x300>",:thumb=>"100x100>"}
#validates_presence_of :attachment, :message=>"^upload your resume"
validates_presence_of :photo, :message=>"^upload your photo"
validates_numericality_of :age, :only_integer => true,:allow_blank=>true,:message=>"^Age should be a no."
validates_numericality_of :mobile, :only_integer => true,:allow_blank=>true,:message=>"^Enter correct mobile no"
validates_length_of :password, :in => 6..12,:allow_blank=>true
validates_confirmation_of :password,:allow_blank=>true,:message=>"^Confirm password must same as password"
#validates_attachment_presence :photo 



file_column :file_upload
end
