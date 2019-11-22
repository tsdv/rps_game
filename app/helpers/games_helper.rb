module GamesHelper
  def game_result(result)
    if result[:winner] == 'user'
      "You win with #{result[:winner_bet]}"
    elsif result[:winner] == 'curb'
      "Curb with #{result[:winner_bet]} wins"
    else
      'In this game is draw'
    end
  end

  def game_winner(winner)
    if winner == 'user'
      'You win'
    elsif winner == 'curb'
      'You lost'
    else
      'Draw'
    end
  end
end
