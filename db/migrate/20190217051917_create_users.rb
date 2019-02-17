class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.string :password
      t.references :Organisation, foreign_key: true

      t.timestamps
    end
  end
end
