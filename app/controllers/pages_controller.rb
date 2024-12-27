class PagesController < ApplicationController

  def home
    @deals = Product.where("discount > 0").limit(8)
  end
end
