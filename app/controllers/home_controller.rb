class HomeController < ApplicationController
    def index
        @products = Product.all
        @buys = Buy.all
    end
end
