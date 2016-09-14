class CreateGethOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :geth_options do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
