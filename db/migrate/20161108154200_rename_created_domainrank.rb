class RenameCreatedDomainrank < ActiveRecord::Migration[5.0]
  def change
  	rename_column :domainranks  , :created_date  , :integer
  end
end
