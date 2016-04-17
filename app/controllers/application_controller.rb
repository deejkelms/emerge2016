class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :current_bar

  def current_bar
    @current_bar ||= Bar.find_by(id: session[:bar_id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end


    #Twitter ---------------------------
    # config = {
    #   consumer_key:    'zIiTzSNnuMFd9KJXH4fUDdYOb',
    #   consumer_secret: 'rhATNFg3yUiC4tdmSaq0cw0bmrPp6iEbvbaELKHi6b0EeFILQg',
    # }
    
    # @client= Twitter::REST::Client.new(config)

    # @tweetText = []
    # @tweetUrl = []
    # @client.search(@bar.twitter).take(10).each do |tweet|
    #     @tweetText << tweet.full_text 
    #     @tweetUrl << tweet.uri.path
    # end
    #twitterUserFind = client.user("sssolar")
    # End of Twitter stuff --------------------
    
    
