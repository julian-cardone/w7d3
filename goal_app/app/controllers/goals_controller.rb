class GoalsController < ApplicationController
    before_action :require_logged_in

    def index
        @goals = Goal.all
        render :index
    end

    def show
        @goal = Goal.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def edit
        @goal = Goal.find_by(id: params[:id])
        render :edit
    end

    def update
        @goal = Goal.find_by(id: params[:id])
        if @goal.update!(goal_params)
            redirect_to goal_url(@goal)
        else
            render json: @goal.errors.full_messages, status: 422
        end
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        @goal.destroy
        redirect_to user_goals_url(@goal.author_id)
    end

    private
    
    def goal_params
        params.require(:goal).permit(:title, :details, :private, :completed)
    end
end