class MyPortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout "my_portfolio"

  def index
      @portfolio_items = MyPortfolio.all
  end

  def new
    @portfolio_item = MyPortfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = MyPortfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
          format.html { redirect_to my_portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to my_portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    
  end

  def edit
    
  end

  def destroy

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to my_portfolios_url, notice: 'Record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:my_portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                     )
  end

  def set_portfolio_item
    @portfolio_item = MyPortfolio.find(params[:id])
  end

end
