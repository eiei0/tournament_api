# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :player_count, default: 0, null: false

      t.timestamps
    end
  end
end
