class CreditsController < ApplicationController
  before_action :set_dealers, only: %i[index create edit update]
  before_action :set_credit, only: %i[show destroy edit update toggle]

  def index
    all_credits = current_user.credits.includes(:dealer).order(created_at: :desc)
    @credits = params[:with_redeemed] ? all_credits : all_credits.unredeemed
    @stats = Credit.stats_for(current_user)
  end

  def create
    @credit = current_user.credits.new(credit_params)

    if @credit.save
      @stats = Credit.stats_for(current_user)
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
      @stats = Credit.stats_for(current_user)
      flash.now[:notice] = "Updated."
    else
      flash.now[:error] = "Did not save. Please try again."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @credit.destroy
    @stats = Credit.stats_for(current_user)
    flash.now[:notice] = "Deleted."
  end

  def toggle
    @credit.toggle!(:redeemed)
    @stats = Credit.stats_for(current_user)
    flash.now[:notice] = "Updated."
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
