class CreateCollects < ActiveRecord::Migration[6.1]
  def change
    create_table :collects do |t|
      t.date :at, null: false
      t.string :asso, null: false
      t.string :other, null: false

      t.timestamps
    end
  end
end
