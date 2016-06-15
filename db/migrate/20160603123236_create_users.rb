class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text :profile_picture

      t.timestamps null: false
    end
  end
end
