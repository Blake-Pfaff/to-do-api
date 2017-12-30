class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 50
      t.string :password, limit: 30

      t.timestamps
    end
  end
end
