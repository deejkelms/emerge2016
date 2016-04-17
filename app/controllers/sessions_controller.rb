class SessionsController < ApplicationController

  def new
  end

  def create
   @bar = Bar.
                 find_by(email: params[:session][:email].downcase)
                 try(:authenticate, params[:password])

   @user= User.
                 find_by(email: params[:session][:email].downcase)
                 try(:authenticate, params[:password])
     if @user
       user = User.omniauth(env['omniauth.auth'])
       session[:user_id] = @user.id
       log_in @user
       redirect_to @user

     elsif @bar
        bar = Bar.omniauth(env['omniauth.auth'])
         session[:bar_id] = @bar.id
         log_in @bar
         redirect_to @bar

     else
       flash.now[:danger] = 'Invalid email/password combination'
       render action: 'new'
     end
  end

   def destroy
     session[:user_id] = nil
     session[:bar_id] = nil
     redirect_to login_path
   end

end
