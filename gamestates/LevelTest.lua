
-- Import our libraries.
bump = require 'libs.bump.bump'
Gamestate = require 'libs.hump.gamestate'

-- Import our Entity system.
local Entities = require 'entities.Entities'
local Entity = require 'entities.Entity'

-- Create our Gamestate
local LevelTest = {}

-- Import the Entities we build.
local Player = require 'entities.Player'
local Ground = require 'entities.Ground'

-- Declare a couple immportant variables
player = nil
world = nil

function LevelTest:enter()
  -- Game Levels do need collisions.
  world = bump.newWorld(16) -- Create a world for bump to function in.

  -- Initialize our Entity System
  Entities:enter()
  player = Player(world, 16, 16)
  ground_0 = Ground(world, 120, 360, 640, 16)
  ground_1 = Ground(world, 0, 448, 640, 16)

  -- Add instances of our entities to the Entity List
  Entities:addMany({player, ground_0, ground_1})
end

function LevelTest:update(dt)
  Entities:update(dt) -- this executes the update function for each individual Entity
end

function LevelTest:draw()
  Entities:draw() -- this executes the draw function for each individual Entity
end

return LevelTest
