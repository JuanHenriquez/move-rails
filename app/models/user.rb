class User < ApplicationRecord

    # Associations.
    has_many :friendships
    has_many :posts
    has_many :photos
    has_many :friends, -> { where( friendships: {status: 'accepted'}) }, :through => :friendships
    has_many :pending_friends, -> { where( friendships: {status: 'requested'}) },
             :through => :friendships,
             :source => :friend
    has_many :requested_friends, -> { where( friendships: {status: 'pending'}) },
             :through => :friendships,
             :source => :friend

    belongs_to :group, optional: true

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    acts_as_messageable

    # Paperclip gem setup
    has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    def self.search(search)
        where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    end

    def name
        "#{first_name} #{last_name}"
    end

    def mailboxer_email(object)
        nil
    end


end
