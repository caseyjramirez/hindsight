class CreatePostings < ActiveRecord::Migration[7.0]
  def change
    create_table :postings do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :community, null: false, foreign_key: true
      t.string :description
      t.boolean :isFilled

      t.timestamps
    end
  end
end
