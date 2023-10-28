class Authentication::SessionsController < ApplicationController
    skip_before_action :protect_pages

    def new
    end

    def create
        @user = User.find_by("dni = :dni", { dni: params[:dni] })
        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/main/index"
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_session_path
    end

end
