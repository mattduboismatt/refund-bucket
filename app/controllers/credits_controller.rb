class CreditsController < ApplicationController
  def index
    @credits = current_user.credits.includes(:dealer).order(created_at: :desc)
    @dealers = Dealer.all.select(:id, :name)
  end

  def create
    @credit = current_user.credits.new(credit_params)
    if @credit.save
      flash[:notice] = "Success!"
      redirect_to credits_path
    else
      @dealers = Dealer.all.select(:id, :name)
      flash[:error] = "Did not save. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:dealer_id, :amount, :notes)
  end
end
