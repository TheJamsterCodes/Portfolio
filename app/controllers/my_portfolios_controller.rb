class MyPortfoliosController < ApplicationController

    def index
        @portfolio_items = MyPortfolio.all
    end

end
