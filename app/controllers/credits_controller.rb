class CreditsController < ApplicationController
  before_action :set_dealers, only: %i[index create edit update]
  before_action :set_credit, only: %i[show destroy edit update]

  def index
    @credits = current_user.credits.includes(:dealer).reverse
  end

  def create
    @credit = current_user.credits.new(credit_params)

    if @credit.save
      @credits = current_user.credits.includes(:dealer).reverse
      flash.now[:notice] = "Created."
    else
      flash.now[:error] = "Did not save. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @credit.update(credit_params)
      @credits = current_user.credits.includes(:dealer).reverse
      flash.now[:notice] = "Updated."
    else
      flash.now[:error] = "Did not save. Please try again."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @credit.destroy
    @credits = current_user.credits.includes(:dealer).reverse
    flash.now[:notice] = "Deleted."
  end

  private

  def credit_params
    params.require(:credit).permit(:dealer_id, :amount, :notes, :expires_at, :never_expires)
  end

  def set_dealers
    @dealers = Dealer.all.select(:id, :name)
  end

  def set_credit
    @credit = current_user.credits.find(params[:id])
  end
end
