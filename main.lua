Gamestate = require 'libs.hump.gamestate'
Menu = require 'gamestates/Menu'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(Menu)
end

function love.update(dt)

end

function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end
