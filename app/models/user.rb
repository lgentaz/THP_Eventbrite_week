class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    after_create :welcome_send

    has_one_attached :avatar
    has_many :guest_attendances, foreign_key: 'guest_id', class_name: "Attendance", dependent: :destroy
    has_many :admin_events, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy
#    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
#    validates :encrypted_password, presence:true, length: { minimum: 6 }

    def full_name
        "#{first_name} #{last_name}"
    end

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
end
