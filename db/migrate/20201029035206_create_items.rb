class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.integer    :price
      t.string     :name,                   null: false, default: ""
      t.text       :explanation
      t.integer    :category_id
      t.integer    :condition_id
      t.integer    :shipping_charge_id
      t.integer    :shipping_area_id
      t.integer    :shipping_days_id
      t.references :user,                   foreign_key: true
    end
  end
end
