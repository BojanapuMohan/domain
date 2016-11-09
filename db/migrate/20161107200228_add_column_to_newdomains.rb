class AddColumnToNewdomains < ActiveRecord::Migration[5.0]
  def change
    add_column :newdomains, :rank_no, :integer
  end
end
