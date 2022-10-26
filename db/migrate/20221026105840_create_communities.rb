class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :description

      t.timestamps
    end
  end
end
