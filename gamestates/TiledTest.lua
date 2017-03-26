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


-- This example uses the included Box2D (love.physics) plugin!!

local sti = require "libs.sti.sti"

function TiledTest:enter()
  print("TiledTest:enter")
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
  player = Player(world, 16, 16)

  Entities:addMany({map, player})

  for i, e in ipairs(world) do
    print("World: ")
    print(e)
  end

	-- Create a Custom Layer
	-- map:addCustomLayer("Sprite Layer", 3)
  --
	-- -- Add data to Custom Layer
	-- local spriteLayer = map.layers["Sprite Layer"]
	-- spriteLayer.sprites = {
	-- 	player = {
	-- 		image = love.graphics.newImage("assets/sprites/player.png"),
	-- 		x = 64,
	-- 		y = 64,
	-- 		r = 0,
	-- 	}
	-- }
  --
-- 	-- Update callback for Custom Layer
-- 	function TiledTest:update(dt)
-- 		for _, sprite in pairs(self.sprites) do
-- 			sprite.r = sprite.r + math.rad(90 * dt)
-- 		end
-- 	end
--
-- 	-- Draw callback for Custom Layer
-- 	function TiledTest:draw()
-- 		for _, sprite in pairs(self.sprites) do
-- 			local x = math.floor(sprite.x)
-- 			local y = math.floor(sprite.y)
-- 			local r = sprite.r
-- 			love.graphics.draw(sprite.image, x, y, r)
-- 		end
-- 	end
-- end
end

function TiledTest:update(dt)
  Entities:update(dt)
end

function TiledTest:draw()
	-- Draw the map and all objects within
	Entities:draw()

	-- Draw Collision Map (useful for debugging)
	-- love.graphics.setColor(255, 0, 0, 255)
	-- map:box2d_draw()
  --
	-- -- Reset color
	-- love.graphics.setColor(255, 255, 255, 255)
end

return TiledTest
