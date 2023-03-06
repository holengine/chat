class ChangeTableUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string "status", default: "offline", null: false
      t.datetime "last_online_at"
    end
  end
end
