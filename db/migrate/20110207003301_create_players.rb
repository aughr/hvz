class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :state

      # as a human
      t.datetime :killed_at

      # as a zombie
      t.integer :kills_count
      t.datetime :last_fed_at

      # the system user this is
      t.references :user, :foreign_key => true

      t.timestamps
    end
    add_foreign_key :players, :users
  end

  def self.down
    drop_table :players
  end
end
