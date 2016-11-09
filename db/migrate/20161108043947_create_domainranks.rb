class CreateDomainranks < ActiveRecord::Migration[5.0]
  def change
    create_table :domainranks do |t|
      t.date :created_date
      t.references :newdomain, foreign_key: true

      t.timestamps
    end
  end
end
