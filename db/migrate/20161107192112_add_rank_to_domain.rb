class AddRankToDomain < ActiveRecord::Migration[5.0]
  def change
  	add_column :newdomains, :rank, :integer
  end
end
