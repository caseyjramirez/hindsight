class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :mentor, null: false, foreign_key: true
      t.belongs_to :mentee, null: false, foreign_key: true
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :community, null: false, foreign_key: true
      t.string :description
      t.boolean :isEstablished

      t.timestamps
    end
  end
end
