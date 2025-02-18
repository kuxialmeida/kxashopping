class PagesController < ApplicationController

  def home
    @products = Product.limit(8)
    # product = Product.where("discount > 0").limit(8)
  end
end
