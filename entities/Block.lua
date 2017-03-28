local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local inspect = require 'inspect'

local Block = Class{
  __includes = Entity -- Ground class inherits our Entity class
}

function Block:init(world, object, image, quad)
  Entity.init(self, world, object.x, object.y, object.width, object.height)
  self.quad = quad
  self.image = image
end

function Block:draw()
  love.graphics.draw(self.image, self.quad, self:getRect())
end

function Block:update(dt)
  self.x = self.x +10*dt
end

return Block
