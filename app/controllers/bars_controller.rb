class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]

  # GET /bars
  # GET /bars.json
  def index
    @bars = Bar.all
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "zIiTzSNnuMFd9KJXH4fUDdYOb"
      config.consumer_secret     = "rhATNFg3yUiC4tdmSaq0cw0bmrPp6iEbvbaELKHi6b0EeFILQg"
    end
    
    @bar = Bar.find(params[:id])
    @tweets = client.user_timeline(@bar.twitter, count:5)
    @current_profile = params[:id]
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
    @bar = Bar.find(params[:id])
  end

  # POST /bars
  # POST /bars.json


  def create
     @bar = Bar.new bar_params
     if @bar.save
       session[:bar_id] = @bar.id
       redirect_to @bar, notice: "WELCOME RAISEtheBAR"
     else
       flash.now[:danger] = 'Invalid email/password combination'
       render action: 'new'
     end
  end

  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { render :show, status: :ok, location: @bar }
      else
        format.html { render :edit }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: 'Bar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    
    def bar_params
      params.require(:bar).permit(:name, :email, :address, :website, :twitter, :hours, :password, :password_confirmation)
    end
end

  # def bar_params
  #   params.
  #   require(:bar).
  #   permit(:name, :email, :address, :twitter, :website, :hours, :password, :password_confirmation)
  # end