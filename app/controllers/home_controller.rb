class HomeController < ApplicationController
    def index
        @products = Product.all
        @buys = Buy.all
        @totalsell = Sell.totalsell 
        @totalbuy = Buy.totalbuy
    end
end
