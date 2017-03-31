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
  world = bump.newWorld(TILE_SIZE)
  Entities:enter(world)
  pcall(TiledObjectFactory.processEntities, TiledObjectFactory, world, mapFile) --wrapping with pcall for old levels
  map = sti(mapFile, {'bump'})
  pcall(map.removeLayer, map, 'entities') --wrapping with pcall for old levels
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
