class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.timestamps
      t.string :title
      t.text :description
      t.string :location
      t.string :category
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.datetime :date
    end
  end
end
