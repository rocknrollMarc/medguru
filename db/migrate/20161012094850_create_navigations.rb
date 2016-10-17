class CreateNavigations < ActiveRecord::Migration
  def change
    create_table :navigations do |t|
      t.string :label
      t.string :description
      t.string :url

      t.timestamps null: false
    end
  end
end
