class GamesController < ApplicationController
  include GamesHelper
  def index
    session["board"] = new_board unless session["board"]
  end

  def move
    board = session["board"]
    if board
      flash[:notice] = "Illegal move, try again." unless play_move(params[:move], board)
      check_winner
    else
      board = new_board
    end

    redirect_to index_path
  end


end
