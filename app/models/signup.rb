class Signup < ApplicationRecord
    belongs_to :activity
    belongs_to :camper
    validate :time_check
    
    def time_check
        if time.to_i > 23 || time.to_i < 0 || time == nil
            errors.add(:time, 'time must be between 0 and 23')
        end
    end
end
