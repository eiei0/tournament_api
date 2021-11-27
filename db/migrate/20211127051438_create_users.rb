# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :given_name, null: false, default: ''
      t.string :family_name, null: false, default: ''
      t.string :middle_name, default: ''
      t.string :nickname, default: ''
      t.string :gender, default: ''
      t.string :email, null: false, default: ''
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
