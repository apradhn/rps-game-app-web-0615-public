class RPSGame
  attr_reader :user_play, :computer_play
  @@plays = [:rock, :scissors, :paper]

  def initialize(user_play)
    if self.class.valid_play?(user_play)
      @user_play = user_play
    else
      raise PlayTypeError
    end
    @computer_play = self.class.plays.sample
  end

  def won?
    if self.user_play == :rock && self.computer_play == :scissors
      true
    elsif self.user_play == :scissors && self.computer_play == :paper
      true
    elsif self.user_play == :paper && self.computer_play == :rock
      true
    else
      false
    end 
  end

  def tied?
    self.user_play == self.computer_play
  end

  def lost?
    if self.computer_play == :rock && self.user_play == :scissors
      true
    elsif self.computer_play == :scissors && self.user_play == :paper
      true
    elsif self.computer_play == :paper && self.user_play == :rock
      true
    else
      false
    end
  end

  def self.plays
    @@plays
  end

  def self.valid_play?(play)
    self.plays.include?(play)
  end

  class PlayTypeError < StandardError
  end
end
