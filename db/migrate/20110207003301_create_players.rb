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
      t.references :users, :foreign_key => true

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
