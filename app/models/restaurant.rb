class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy

  validates :name, :address, presence: true
  validates :category, inclusion: {in: CATEGORIES}

  def rating_display
    filled_star  = "<i class='fas fa-star'></i>"
    empty_star = "<i class='far fa-star'></i>"
    if reviews.length == 0
      return "Be the first to review"
    else
      total = rating_average
      padding = 5 - total
      return "#{filled_star * total}#{empty_star * padding}".html_safe
    end
  end

  def rating_average
    total = 0
    reviews.each do |review|
      total += review.rating
    end
    total /= reviews.length
  end
end
