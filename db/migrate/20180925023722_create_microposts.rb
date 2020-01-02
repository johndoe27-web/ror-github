class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    # rails g model Micropost content:text user:references
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
