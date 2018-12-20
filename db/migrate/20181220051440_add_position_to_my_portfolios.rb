class AddPositionToMyPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :my_portfolios, :position, :integer
  end
end
