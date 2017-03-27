Gamestate = require 'libs.hump.gamestate'
Level = require 'gamestates/Level'

local Menu = {}

local levels = {}
levels.a = 'assets/maps/level1.lua'
levels.b = 'assets/maps/level2.lua'

function Menu:enter()
end

function Menu:update(dt)
end

function Menu:draw()
  local y = 0
  for key, level in pairs(levels) do
    local text = string.format("%s: %s", key, level)
    love.graphics.print(text, 0, y)
    y = y + 15
  end
end

function Menu:textinput(text)
  if levels[text] then
    Gamestate.push(Level, levels[text])
  end
end

return Menu
