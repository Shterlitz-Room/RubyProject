class Product < ApplicationRecord
  has_one_attached :image

  validates :name, :price, :category, :gender, presence: true

  CATEGORIES = {
    "tshirt" => "Футболки",
    "jeans" => "Джинсы",
    "jacket" => "Куртки"
  }.freeze

  GENDERS = {
    "all" => "Все",
    "male" => "М",
    "female" => "Ж"
  }.freeze

  scope :by_category, ->(slug) {
    if slug.present? && slug != "all"
      where(category: slug)
    else
      all
    end
  }
  scope :by_gender, ->(g) {
    if g.present? && g != "all"
      where("products.gender = ? OR products.gender = ?", g, "all")
    else
      all
    end
  }
  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }

  def on_sale?
    compare_at_price.present? && compare_at_price > price
  end

  def discount_percent
    return 0 unless on_sale?

    (((compare_at_price - price) / compare_at_price) * 100).round
  end

  def display_price
    format("%.0f", price)
  end
end
