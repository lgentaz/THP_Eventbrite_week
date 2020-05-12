module UsersHelper
    def current_user?(user_id)
        user_id == current_user.id
    end
end
