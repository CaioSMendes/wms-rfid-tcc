class HomeController < ApplicationController
    def index
        @categories = Categorie.all
        @providers = Provider.all
        @products = Product.all
        @clients = Client.all
        @sells = Sell.all
        @buys = Buy.all
        @totalsell = Sell.totalsell 
        @totalbuy = Buy.totalbuy
    end
end
