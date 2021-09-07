class HomeController < ApplicationController
    def index
        @products = Product.all
        @buys = Buy.all
        @totalsell = Sell.totalsell 
        @totalbuy = Buy.totalbuy
        @data = Client.group(:corporateName).count
        #@female_user = User.where(gender: :female).group_by_week(:birthday).count
    end
end
