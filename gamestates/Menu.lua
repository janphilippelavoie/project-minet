Gamestate = require 'libs.hump.gamestate'
Level = require 'gamestates/Level'

local Menu = {}

function Menu:enter()
end

function Menu:update(dt)
end

function Menu:draw()
  love.graphics.printf("Press enter!", 0, love.graphics.getHeight()/2,
   love.graphics.getWidth(), 'center', 0, 1, 1)
end

function Menu:keyreleased(key, code)
    if key == 'return' then
        Gamestate.push(Level, 'assets/maps/level1.lua')
    end
end

return Menu
