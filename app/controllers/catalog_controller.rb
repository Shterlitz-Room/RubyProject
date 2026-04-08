class CatalogController < ApplicationController
  def index
    @query = query_params
    scope = Product.includes(image_attachment: :blob)
    scope = scope.by_category(@query[:category])
    scope = scope.by_gender(@query[:gender])
    @products = case @query[:sort]
    when "price_asc"
      scope.price_asc
    when "price_desc"
      scope.price_desc
    else
      scope.order(created_at: :desc)
    end
  end

  private

  def query_params
    params.permit(:category, :gender, :sort).to_h.symbolize_keys
  end
end
