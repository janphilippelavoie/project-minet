Gamestate = require 'libs.hump.gamestate'
TiledTest = require 'gamestates/TiledTest'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(TiledTest)
end

function love.update(dt)

end

function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end
