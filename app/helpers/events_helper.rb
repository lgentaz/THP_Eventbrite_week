module EventsHelper
    def organise?(event)
        event.admin == current_user
    end

    def attending?(event)
        event.guests.include?(current_user)
    end
end
