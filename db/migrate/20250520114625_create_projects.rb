class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :details
      t.string :link
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
