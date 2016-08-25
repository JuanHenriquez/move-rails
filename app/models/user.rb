class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    acts_as_messageable

    # Paperclip gem setup
    has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    
    def name
        "#{first_name} #{last_name}"
    end
    
    def mailboxer_email(object)
        nil
    end
    

end
