class CreditsController < ApplicationController
  before_action :set_credit, only: %i[destroy]

  def index
    @credits = current_user.credits.includes(:dealer).reverse
    @dealers = Dealer.all.select(:id, :name)
  end

  def create
    @credit = current_user.credits.new(credit_params)
    if @credit.save
      @credits = current_user.credits.includes(:dealer).reverse
      flash.now[:notice] = "Success!"
    else
      @dealers = Dealer.all.select(:id, :name)
      flash[:error] = "Did not save. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @credit.destroy
    @credits = current_user.credits.includes(:dealer).reverse
    flash.now[:notice] = "Credit deleted."
  end

  private

  def credit_params
    params.require(:credit).permit(:dealer_id, :amount, :notes)
  end

  def set_credit
    @credit = current_user.credits.find(params[:id])
  end
end
