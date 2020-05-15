class Event < ApplicationRecord

    belongs_to :admin, class_name: "User"
    has_many :attendances, dependent: :destroy
    has_many :guests, class_name: "User", through: :attendances, dependent: :destroy
    has_one_attached :illustration

    validates :start_date, presence: true
    validate :start_must_be_future
    validates :duration, presence: true
    validate :duration_positive
    validate :duration_5
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, inclusion: { in: 0..1000 }
    validates :location, presence: true
#    validates :illustration, presence: true

    def start_must_be_future
        return unless start_date 
        errors.add(:start_date, "ne doit pas être passée") unless start_date > Time.now
    end

    def end_date
        start_date + (duration * 60)
    end

    def duration_positive
        return unless duration < 0
    end

    def duration_5
        return unless duration != 0 
    end

end
