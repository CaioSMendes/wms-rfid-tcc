class HomeController < ApplicationController
    def index
        @products = Product.all
        @buys = Buy.all
        @totbuy = Buy.total
        @totsell = Sell.total

    end
end
