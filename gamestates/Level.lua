-- Import our libraries.
bump = require 'libs.bump.bump'
Gamestate = require 'libs.hump.gamestate'
sti = require 'libs.sti.sti'

-- Import our Entity system.
local Entities = require 'entities.Entities'
local Player = require 'entities.Player'
local Block = require 'entities.Block'
local inspect = require "inspect"


local Level = {}

-- Import the Entities we build.

-- Declare a couple immportant variables
player = nil
world = nil


function Level:enter(_, mapFile)
  map = sti(mapFile, {"bump"})

  -- map = sti(mapFile, {"bump"})

  world = bump.newWorld(32) -- Create a world for bump to function in.

  Entities:enter()

  processObjectLayer(map, 'meta')

  map:bump_init(world)

  -- Initialize our Entity System
  Entities:add(player)
end

function Level:keypressed(key)
  if key == 'backspace' then
    Gamestate.pop()
  end
end

function Level:update(dt)
  if player.hasReachedExit then
    return Gamestate.pop()
  end
  Entities:update(dt)
end

function Level:draw()
  map:draw()
	Entities:draw()
end

function processObjectLayer(map, layerName)
  for index, layer in ipairs(map.layers) do
    if layer.name == layerName then
      for _, object in pairs(layer.objects) do
        if object.type == 'block' then
          block = Block(world, object, map.tileset[object.tilesset].image, map.tiles[object.gid].quad)
          Entities:add(block)
        end
        if object.type == 'player' then
          player = Player(world, object)
          Entities:add(player)
        end
      end

      map:removeLayer(index)
    end
  end
end

function getObject(layerName, objectName)
  for _, layer in ipairs(map.layers) do
    if layer.type == 'objectgroup' and layer.name == layerName then
      for _, object in ipairs(layer.objects) do
        if object.name == objectName then
          return object
        end
      end
    end
  end
  return nil
end

return Level
