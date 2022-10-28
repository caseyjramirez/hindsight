class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :mentor, references: :users, foreign_key: {to_table: :users}
      t.belongs_to :mentee, references: :users, foreign_key: {to_table: :users}
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :community, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
