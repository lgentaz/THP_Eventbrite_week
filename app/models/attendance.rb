class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :guest, class_name: "User"
    validates :guest_id, uniqueness: { scope: [:event_id] }
end
