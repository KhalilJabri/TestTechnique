class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.integer :role, default: 1
      t.boolean :is_active, default: true
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true

  end
end
