class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                       null:false
      t.integer :price,                     null:false
      t.integer :category,                  null:false
      t.integer :status,                    null:false
      t.integer :fee,                       null:false
      t.integer :region,                    null:false
      t.integer :shipment_day,              null:false
      t.text :explanation,                  null:false
      t.integer :user_id,                   null:false, foreign_key: true
      t.timestamps
    end
  end
end
