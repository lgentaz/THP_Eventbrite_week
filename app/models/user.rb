class User < ApplicationRecord
    after_create :welcome_send

    has_many :guest_attendances, foreign_key: 'guest_id', class_name: "Attendance"
    has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
#    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
#    validates :encrypted_password, presence:true, length: { minimum: 6 }

    def full_name
        "#{first_name} #{last_name}"
    end

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
end
