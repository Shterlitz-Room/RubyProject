class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @catalog_params = params.permit(:category, :gender, :sort).to_h.compact_blank
    unless turbo_frame_request?
      redirect_to catalog_path, status: :see_other
      return
    end
    render layout: false
  end
end
