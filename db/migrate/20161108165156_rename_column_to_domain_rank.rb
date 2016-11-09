class RenameColumnToDomainRank < ActiveRecord::Migration[5.0]
  def change
  	remove_column :domainranks	, :integer
  	add_column :domainranks , :created_date , :string
  end
end
