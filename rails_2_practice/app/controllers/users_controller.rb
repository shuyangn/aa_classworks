class UsersController < ApplicationController
    
    before_action :require_logged_in!, only: [:show, :index]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            login(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def index
        @users = User.all
        render :index
    end

    # def edit
    #     @user = User.find_by(id: params[:id])
    #     render :edit
    # end

    # def update
    #     @user = User.find(params[:id])
    #     if @user.update(user_params)
    #         redirect_to user_url(@user)
    #     else
    #         flash[:errors] = @user.errors.full_messages
    #     end
    # end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
