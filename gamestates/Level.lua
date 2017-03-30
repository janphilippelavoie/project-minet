-- Import our libraries.
local bump = require 'libs.bump.bump'
local sti = require 'libs.sti.sti'
Gamestate = require 'libs.hump.gamestate'
Camera = require 'libs.hump.camera'

-- Import our Entity system.
local Entities = require 'entities.Entities'
local TiledObjectFactory = require 'helpers.TiledObjectFactory'


local Level = {}

camera = nil
local map, world

function Level:enter(_, mapFile)
  map = sti(mapFile, {"bump"})
  world = bump.newWorld(32)
  Entities:enter(world)
  TiledObjectFactory:processObjectLayer(world, map, 'meta')
  map:bump_init(world)
  camera = Camera(0, love.graphics.getHeight()/2)

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
  camera:attach()
  map:draw()
	Entities:draw()
  camera:detach()
end

return Level
