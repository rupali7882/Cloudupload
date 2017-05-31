class CreateOrderTransjections < ActiveRecord::Migration[5.1]
  def change
    create_table :order_transjections do |t|
      t.integer :order_id
      t.string :transaction_id
      t.string :ip_address
      t.integer :status

      t.timestamps
    end
  end
end
