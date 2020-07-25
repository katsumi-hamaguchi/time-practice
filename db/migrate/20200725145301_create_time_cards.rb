class CreateTimeCards < ActiveRecord::Migration[5.2]
  def change
    create_table :time_cards do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.datetime :in_at
      t.datetime :out_at
      t.integer :user_id

      t.timestamps
    end
  end
end
