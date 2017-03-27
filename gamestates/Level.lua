-- Import our libraries.
bump = require 'libs.bump.bump'
Gamestate = require 'libs.hump.gamestate'
sti = require 'libs.sti.sti'

-- Import our Entity system.
local Entities = require 'entities.Entities'
local Player = require 'entities.Player'


local Level = {}

function Level:enter(_, mapFile)
  map = sti(mapFile, {"bump"})

  world = bump.newWorld(32) -- Create a world for bump to function in.
  map:bump_init(world)
  Entities:enter()
  playerObject = getObject('meta', 'player')
  print(playerObject.properties)
  player = Player(world, playerObject.x, playerObject.y, playerObject.properties.color)
  Entities:addMany({map, player})
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
	Entities:draw()
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
