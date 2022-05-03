class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups
    validates :name, presence: true
    validate :age_range

    def age_range
        if age < 8 || age > 18
            render json: {errors: 'validation errors'}, status: :unprocessable_entity
        end
    end
end
