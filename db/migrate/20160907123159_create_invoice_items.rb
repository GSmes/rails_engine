class CreateInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
