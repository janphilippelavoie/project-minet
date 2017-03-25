Gamestate = require 'libs.hump.gamestate'
LevelTest = require 'gamestates/LevelTest'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(LevelTest)
end

function love.update(dt)

end

function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end
