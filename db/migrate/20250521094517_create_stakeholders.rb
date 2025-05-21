class CreateStakeholders < ActiveRecord::Migration[8.0]
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :position
      t.string :linkedin
      t.references :buyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
