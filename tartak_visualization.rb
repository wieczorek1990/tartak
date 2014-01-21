require 'gosu'

class Window < Gosu::Window
  WIDTH=640
  HEIGHT=480
  def initialize
    super WIDTH, HEIGHT, false
    self.caption = "Tartak"
    @last_frame = Gosu::milliseconds
  end
  
  def update
   @this_frame = Gosu::milliseconds
   @delta = (@this_frame - @last_frame) / 1000.0
   @last_frame = @this_frame
  end
  
  def draw
    draw_background
  end

  def draw_square(x, y, w, h, c)
    draw_quad(x,   y,   c,
              x+w, y,   c,
              x,   y+h, c,
              x+w, y+h, c)
  end

  def draw_background
    draw_square(0, 0, WIDTH, HEIGHT, Gosu::Color::WHITE)
  end
end

Window.new.show