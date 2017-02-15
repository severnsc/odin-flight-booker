class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :dept_airport
      t.references :arrival_airport
      t.datetime :dept_datetime
      t.datetime :arrival_datetime
      t.float :duration

      t.timestamps
    end
    add_foreign_key :flights, :airports, column: :dept_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
