class CreateIndicators < ActiveRecord::Migration[6.1]
  def change
    create_table :indicators do |t|
      t.string :name, null:false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
