class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.text :session_token, null: false
      t.text :password_digest, null: false

      t.timestamps null: false
    end
  end
end
