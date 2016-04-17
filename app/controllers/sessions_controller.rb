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
     if @bar
       session[:bar_id] = @bar.id
       puts 'bar'
       redirect_to current_bar


     elsif @user
         session[:user_id] = @user.id
         puts 'user'
         redirect_to current_user

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
