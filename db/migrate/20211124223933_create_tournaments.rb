class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.timestamp :start_date
      t.timestamp :end_date
      t.timestamp :registration_start_date
      t.timestamp :registration_end_date
      t.text :description
      t.integer :team_cap

      t.timestamps
    end
  end
end
