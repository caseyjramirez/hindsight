class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :description
      t.belongs_to :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
