module EventsHelper
    def organise?(event)
        event.admin == current_user
    end

    def attending?(event)
        event.guests.include?(current_user)
    end

    def is_free?(event)
        event.price == 0
    end

end
