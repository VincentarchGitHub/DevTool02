class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :ref_num
      t.string :postcode
      t.string :description
      t.integer :views, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
