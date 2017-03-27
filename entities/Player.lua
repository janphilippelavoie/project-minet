local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local utils = require 'utils'

local Player = Class{
  __includes = Entity -- Player class inherits our Entity class
}

function Player:init(world, x, y, color)

  self.playerImages = {}
  self.playerImages.blue = love.graphics.newImage('assets/images/character_block_blue.png')
  self.playerImages.red = love.graphics.newImage('assets/images/character_block_red.png')
  self.playerImages.green = love.graphics.newImage('assets/images/character_block_green.png')
  self.img = self.playerImages.blue
  Entity.init(self, world, x, y, self.img:getWidth(), self.img:getHeight())

  -- Add our unique Player values
  self.xVelocity = 0 -- current velocity on x, y axes
  self.yVelocity = 0
  self.acc = 100 -- the acceleration of our Player
  self.maxSpeed = 600 -- the top speed
  self.friction = 20 -- slow our Player down - we could toggle this situationally to create icy or slick platforms
  self.gravity = 80 -- we will accelerate towards the bottom

    -- These are values applying specifically to jumping
  self.isGrounded = false -- are we on the ground?
  self.hasReachedMax = false  -- is this as high as we can go?
  self.jumpAcc = 500 -- how fast do we accelerate towards the top
  self.jumpMaxSpeed = 11 -- our speed limit while jumping

  self.world:add(self, self:getRect())
  self.color = color or 'blue'
  self.hasReachedExit = false
end
function Player:collisionFilter(other)

  if other.properties.isExit then
    self.hasReachedExit = true
  elseif other.properties.magicColor == self.color then
    return 'cross'
  elseif other.properties.vortex then
    self.color = other.properties.vortex
  elseif other.properties.breakable and player.color == 'red' then
    print(other.y)
    -- self.world:remove(other, other.getRect)
  else
    return 'slide'
  end
end

function Player:update(dt)
  self.img = self.playerImages[self.color]
  local prevX, prevY = self.x, self.y

  -- Apply Friction
  self.xVelocity = self.xVelocity * (1 - math.min(dt * self.friction, 1))
  self.yVelocity = self.yVelocity * (1 - math.min(dt * self.friction, 1))

  -- Apply gravity
  self.yVelocity = self.yVelocity + self.gravity * dt

	if love.keyboard.isDown("left", "a") and self.xVelocity > -self.maxSpeed then
		self.xVelocity = self.xVelocity - self.acc * dt
	elseif love.keyboard.isDown("right", "d") and self.xVelocity < self.maxSpeed then
		self.xVelocity = self.xVelocity + self.acc * dt
	end

  -- The Jump code gets a lttle bit crazy.  Bare with me.
  if love.keyboard.isDown("up", "w", " ") then
    if -self.yVelocity < self.jumpMaxSpeed and not self.hasReachedMax then
      self.yVelocity = self.yVelocity - self.jumpAcc * dt
    elseif math.abs(self.yVelocity) > self.jumpMaxSpeed then
      self.hasReachedMax = true
    end
    self.isGrounded = false -- we are no longer in contact with the ground
  end

  -- these store the location the Player will arrive at should
  local goalX = self.x + self.xVelocity
  local goalY = self.y + self.yVelocity

  -- Move the Player while testing for collisions
  self.x, self.y, collisions, len = self.world:move(self, goalX, goalY, self.collisionFilter)

  -- Loop through those collisions to see if anything important is happening
  for i, coll in ipairs(collisions) do
    if coll.touch.y < goalY and coll.type == 'slide' then  -- We touched below (remember that higher locations have lower y values) our intended target.
      self.isGrounded = true
      self.hasReachedMax = false
    end
  end
end

function Player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

return Player
