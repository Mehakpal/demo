class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :place
      t.float :lng
      t.float :lat

      t.timestamps
    end
  end
end
