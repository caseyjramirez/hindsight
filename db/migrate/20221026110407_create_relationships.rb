class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :mentor, null: false, foreign_key: true
      # removed null: false for mentee bc when init it will be empty
      t.belongs_to :mentee
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :community, null: false, foreign_key: true
      t.string :description
      t.boolean :isEstablished

      t.timestamps
    end
  end
end
