class User < ApplicationRecord
  has_many :credits, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def sort_credits(params = {})
    associations = {"dealer" => "dealers.name"}
    sort_column =
      params[:sort]
        .presence_in(%w[dealer amount_cents reference_number expires_at notes]) || "created_at"

    sort_column = associations[sort_column] || sort_column

    sort_direction =
      params[:direction].presence_in(%w[asc desc]) || "desc"

    credits
      .includes(:dealer)
      .order(sort_column => sort_direction)
  end
end
