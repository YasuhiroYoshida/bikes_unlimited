class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.belongs_to :upload, index: true, foreign_key: true

      t.timestamps
    end
  end
end
