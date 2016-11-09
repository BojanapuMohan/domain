class AddRankToDomainranks < ActiveRecord::Migration[5.0]
  def change
  	add_column :domainranks, :rank, :integer
  end
end
