class SignupsController < ApplicationController

    def create 
        signup = Signup.new(time: params[:time],camper_id: params[:camper_id], activity_id: params[:activity_id])
        if signup.valid?
            signup.save
            render json: Activity.find(params[:activity_id]), status: 201
        else
            render json: {error: signup.errors}, status: :unprocessable_entity
        end
    end

end
