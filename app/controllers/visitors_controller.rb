class VisitorsController < ApplicationController
  def index
    if params[:sort] == "alphabetical"
      @products = Product.all.order(name: :asc)
    else
      @products =Product.all
    end
  end
end
