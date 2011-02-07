require 'spec_helper'

describe Player do
  it "should initially be a human" do
    subject.valid? # needed to trigger the initial state
    subject.state.should == "human"
  end

  describe "#kill" do
    it "should return false when the player is human" do
      subject.stubs(:human?).returns(true)
      subject.kill(mock('other player')).should be_false
    end

    it "should return false when the other player is not human" do
      subject.stubs(:human?).returns(false)
      other_player = mock('other player', :human? => false)
      subject.kill(other_player).should be_false
    end

    it "should mark the other player as killed" do
      subject.stubs(:human?).returns(false)
      other_player = mock('other_player')
      other_player.expects(:killed!)
      other_player.stubs(:human?).returns(true)
      subject.kill(other_player).should be_true
    end

    it "should update the player's feeding date" do
      subject.stubs(:human?).returns(false)
      other_player = mock('other_player')
      other_player.stubs(:killed!)
      other_player.stubs(:human?).returns(true)
      Timecop.freeze do
        subject.last_fed_at = 1.day.ago
        now = Time.now
        subject.kill(other_player)
        subject.last_fed_at.should == now
      end
    end

    it "should work when the player is an original zombie" do
      subject.state = "original_zombie"
      other_player = mock('other_player')
      other_player.stubs(:killed!)
      other_player.stubs(:human?).returns(true)
      subject.kill(other_player).should be_true
    end
  end

  describe "#killed!" do
    before(:each) { subject.valid? } # set the initial state

    it "should zombify the player" do
      subject.killed!
      subject.should be_zombie
    end

    it "should mark the kill time" do
      Timecop.freeze do
        now = Time.now
        subject.killed_at.should be_nil
        subject.killed!
        subject.killed_at.should == now
      end
    end
  end

  describe "#public_kills" do
    before(:each) { subject.valid? } # set the initial state

    it "should be 0 at first" do
      subject.public_kills.should == 0
    end

    it "should show the right value if the player's a zombie" do
      subject.kills_count = 2
      subject.public_kills.should == 2
    end

    it "should be 0 if the player's an original zombie" do
      subject.state = "original_zombie"
      subject.kills_count = 2
      subject.public_kills.should == 0
    end
  end
end

