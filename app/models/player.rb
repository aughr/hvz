class Player < ActiveRecord::Base
  include ActiveRecord::Transitions

  state_machine do
    state :human
    state :original_zombie
    state :zombie, :enter => lambda {|player| player.killed_at = Time.now }

    event :killed do
      transitions :to => :zombie, :from => [:human]
    end

    event :revealed! do
      transitions :to => :zombie, :from => [:original_zombie]
    end
  end

  def kill(other_player)
    if human? || !other_player.human?
      false
    else
      other_player.killed!
      self.last_fed_at = Time.now
      true
    end
  end

  def public_kills
    if original_zombie?
      0
    else
      kills_count || 0
    end
  end
end
