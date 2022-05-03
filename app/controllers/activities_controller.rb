class ActivitiesController < ApplicationController
    def index
        render json: Activity.all
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        render json: {}, status: 200
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Activity not found'}, status: 404
    end

end
