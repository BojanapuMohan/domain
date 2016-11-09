class CreateNewdomains < ActiveRecord::Migration[5.0]
  def change
    create_table :newdomains do |t|
      t.string :domain_name

      t.timestamps
    end
  end
end
