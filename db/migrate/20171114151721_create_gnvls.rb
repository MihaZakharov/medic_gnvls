class CreateGnvls < ActiveRecord::Migration[5.0]
  def change
    create_table :gnvls do |t|
      t.string :mnn
      t.string :name
      t.string :lekform
      t.string :owner
      t.string :qntpack
      t.decimal :prc_wo_nds
      t.decimal :prc_first_pack
      t.text :n_py
      t.string :date_reg
      t.string :ean13
      t.string :atx
      t.string :level_nac_opt
      t.decimal :pred_opt_price
      t.string :level_nac_rozn
      t.decimal :pred_rozn_price

      t.timestamps
    end
  end
end
