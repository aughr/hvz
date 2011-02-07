class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at

      t.references :user, :foreign_key => true

      t.timestamps
    end
    add_foreign_key :games, :users
  end

  def self.down
    drop_table :games
  end
end
