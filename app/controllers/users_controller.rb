class UsersController < ApplicationController
    before_action  :check_guest_user, only: [:edit]

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            sign_in(current_user, bypass:true)
            flash[:notice]="update profile completed successfully."
            redirect_to user_path
        else
            flash[:alert]="failed update profile."
            render :edit
        end
    end

    def change
        @user = current_user
        if params[:team_id].to_i != @user.keep_team_id
            @user.keep_team_id = params[:team_id]
            @user.save
            flash[:notice]="change current-group completed successfully."
        end 
        redirect_to user_path
    end

    def show 
        @user = current_user
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :keep_team_id)
    end
end
