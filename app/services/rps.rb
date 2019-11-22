class Rps
  attr_reader :curb_bet

  def initialize(bet)
    @user_bet = bet.to_sym
    @curb_bet = CurbApi.bet
  end

  def game
    if rules[@curb_bet].include?(@user_bet)
      result('curb', @curb_bet.to_s, @curb_bet.to_s)
    elsif rules[@user_bet].include?(@curb_bet)
      result('user', @curb_bet.to_s, @user_bet.to_s)
    else
      result('draw', @curb_bet.to_s, @user_bet.to_s)
    end
  end

  def result(winner, curb_bet, winner_bet)
    {
      winner: winner,
      curb_bet: curb_bet,
      winner_bet: winner_bet
    }
  end

  def rules
    {
      rock: %i[scissors],
      scissors: %i[paper],
      paper: %i[rock]
    }
  end
end
