class CreateTestimonials < ActiveRecord::Migration[8.0]
  def change
    create_table :testimonials do |t|
      t.string :client
      t.text :details
      t.references :seller, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
