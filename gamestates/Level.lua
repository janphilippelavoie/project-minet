-- Import our libraries.
bump = require 'libs.bump.bump'
Gamestate = require 'libs.hump.gamestate'
sti = require 'libs.sti.sti'

-- Import our Entity system.
local Entities = require 'entities.Entities'
local TiledHelper = require 'helpers.TiledHelper'


local Level = {}

-- Import the Entities we build.

function Level:enter(_, mapFile)
  map = sti(mapFile, {"bump"})

  world = bump.newWorld(32)

  Entities:enter()
  TiledHelper:processObjectLayer(world, map, 'meta')
  map:bump_init(world)

end

function Level:keypressed(key)
  if key == 'backspace' then
    Gamestate.pop()
  end
end

function Level:update(dt)
  map:update(dt)
  Entities:update(dt)
end

function Level:draw()
  map:draw()
	Entities:draw()
end

return Level
