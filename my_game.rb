require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window

  def initialize
    super(1000,1000,false)
    @player = Player.new(self)
    @ball = Ball.new(self)
  end

  def update
    if button_down? Gosu::Button::KbLeft
      @player.move_left
    end
    if button_down? Gosu::Button::KbRight
      @player.move_right
    end
    if button_down? Gosu::Button::KbDown
      @player.move_down
    end
    if button_down? Gosu::Button::KbUp
      @player.move_up
    end
    
    if button_down? Gosu::Button::KbSpace
      @player.jump
    end

    @ball.update
    @player.update
  end

  def draw
    @player.draw
    @ball.draw
  end
end

window = MyGame.new
window.show
