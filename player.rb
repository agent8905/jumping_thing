class Player
  def initialize(game_window)
    @game_window = game_window
    @icon =Gosu::Image.new(@game_window, "images/player.png")
    @x = 50
    @y = 50
    @jumping = false
  end

  def update
    if @jumping
      if @go_up
        handle_up_motion
      elsif @go_down
        handle_down_motion
      end
    end
  end
  
  def handle_up_motion
    if @go_down_at < Time.now.to_f
      @go_down = true
      @go_up = false
    else
      @y = @y - 20
    end
  end
  
  def handle_down_motion
    if @end_jump_at < Time.now.to_f
      @jumping = false
    else
      @y = @y + 20
    end
  end
  
  def jump
    unless @jumping
      @go_up = true
      @jumping = true
      @go_down_at = (Time.now.to_f + 0.4)
      @end_jump_at = @go_down_at + 0.4
    end
  end
  

  def draw
    @icon.draw(@x,@y,1)
  end

  def move_left
    if @x < 0 
      @x = 0
    else
      @x = @x - 10
    end
  end

  def move_right
    if @x > (@game_window.width - @icon.width)
      @x = @game_window.width - @icon.width
    else
      @x = @x + 10
    end
  end

  def move_up
    if @y < 0 
      @y = 0
    else
      @y = @y - 10
    end
  end

  def move_down
    if @y >(@game_window.height - @icon.height)
      @y = @game_window.height - @icon.height
    else
      @y = @y + 10
    end
  end
end
