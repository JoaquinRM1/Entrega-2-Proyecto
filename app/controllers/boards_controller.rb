class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @tasks = Task.all
    @states = State.all
    @users = User.all
  end
end
