class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:room]}"
  end

  def receive(data)
    puts(data)
    ActionCable.server.broadcast("game_#{params[:room]}", data)
  end
end
