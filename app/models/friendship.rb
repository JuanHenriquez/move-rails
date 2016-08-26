class Friendship < ApplicationRecord

    # Associations.
    belongs_to :user
    belongs_to :friend, class_name: "User"

    def self.request(user, friend)
        puts "Hola!"
        unless user == friend or Friendship.exists?({ user_id: user.id, friend_id: friend.id })
            transaction do
                create(:user => user, :friend => friend, :status => 'requested')
                create(:user => friend, :friend => user, :status => 'pending')
            end
        end
    end

    def self.accept(user, friend)
        transaction do
            accepted_at = Time.now
            accept_one_side(user, friend, accepted_at)
            accept_one_side(friend, user, accepted_at)
        end
    end

    def self.delete(user, friend)
        user_i = find_by(user_id: user.id)
        friend_i = find_by(user_id: friend.id)

        transaction do
            if Friendship.exists?({ user_id: user.id, friend_id: friend.id })
                user_i.destroy!
            end

            if Friendship.exists?({ user_id: friend.id, friend_id: user.id })
                friend_i.destroy!
            end
        end
    end

    def self.accept_one_side(user, friend, accepted_at)
        request = find_by(user_id: user.id, friend_id: friend.id)
        request.status = 'accepted'
        request.accepted_at = accepted_at
        request.save!
    end


end
