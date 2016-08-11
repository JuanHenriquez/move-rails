class User < ApplicationRecord
    
    # Validation.
    validates_presence_of :name, :user_picture, :password, :email, :country, :tel, message: "Please fill in all the fields"
    validates_uniqueness_of :email, message: "A user already exists with this email"
    
    # Paperclip gem setup
    has_attached_file :user_picture, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :user_picture, content_type: /\Aimage\/.*\Z/
    
end
