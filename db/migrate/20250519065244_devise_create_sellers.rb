# frozen_string_literal: true

class DeviseCreateSellers < ActiveRecord::Migration[8.0]
  def change
    create_table :sellers do |t|
      ## Database authenticatable
      t.string :username,           null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :position
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :industry
      t.string :solutions, array: true, default: []
      t.string :pain_points, array: true, default: []
      t.string :slug

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :sellers, :email,                unique: true
    add_index :sellers, :reset_password_token, unique: true
    add_index :sellers, :slug, unique: true
    # add_index :sellers, :confirmation_token,   unique: true
    # add_index :sellers, :unlock_token,         unique: true
  end
end
