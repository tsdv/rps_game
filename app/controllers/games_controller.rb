class GamesController < ApplicationController
  def index; end

  def throw
    @rps = Rps.new(params[:bet])
    @result = @rps.game
  end
end
