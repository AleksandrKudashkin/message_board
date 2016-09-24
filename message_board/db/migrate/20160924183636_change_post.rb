class ChangePost < ActiveRecord::Migration[5.0]
  def change
    change_table(:posts) do |t|
     t.remove :author
     t.references :user, index: true
    end
  end
end
