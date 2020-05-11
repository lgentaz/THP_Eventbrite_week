class Attendance < ApplicationRecord
    after_create :attending_send

    belongs_to :event
    belongs_to :guest, class_name: "User"
    validates :guest_id, uniqueness: { scope: [:event_id] }

    def attending_send
        GuestMailer.attending_email(self).deliver_now
    end

end
