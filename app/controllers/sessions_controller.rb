class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create 
    
    
    def create
       user = User.find_by(username: params[:username])
       if user&.authenticate(params[:password])
       session[:user_id] = user_id
       render json: user
       else
        render json: {errors: ["Incorrect Username or Password"]}, status: :unauthorized
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

end