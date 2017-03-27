-- Import our libraries.
bump = require 'libs.bump.bump'
Gamestate = require 'libs.hump.gamestate'

-- Import our Entity system.
local Entities = require 'entities.Entities'

-- Create our Gamestate
local TiledTest = {}

-- Import the Entities we build.
local Player = require 'entities.Player'
local Ground = require 'entities.Ground'

-- Declare a couple immportant variables
player = nil
world = nil


local sti = require "libs.sti.sti"

function TiledTest:enter()
	-- Grab window size
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	-- Set world meter size (in pixels)
	love.physics.setMeter(32)

	-- Load a map exported to Lua from Tiled
	map = sti("assets/maps/testlevel.lua", {"bump"})

	-- Prepare physics world with horizontal and vertical gravity
  -- Prepare collision objects

  world = bump.newWorld(32) -- Create a world for bump to function in.
  map:bump_init(world)
  -- Initialize our Entity System
  Entities:enter()

  playerObject = getObject('meta', 'player')
  player = Player(world, playerObject.x, playerObject.y)

  Entities:addMany({map, player})


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

function TiledTest:update(dt)
  if player.hasReachedExit then
    return Gamestate.pop()
  end
  Entities:update(dt)
end

function TiledTest:draw()
	Entities:draw()
end

return TiledTest
