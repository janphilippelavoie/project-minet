local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'

local Block = Class{
  __includes = Entity -- Ground class inherits our Entity class
}

function Block:init(world, x, y, width, height, properties)
  Entity.init(self, world, x, y, width, height)
  self.properties = properties
end

function Block:draw()
  love.graphics.rectangle("fill", self:getRect())
end

function Block:update(dt)
  local goalX = self.x + 30*dt
  local goalY = self.y - 60*dt
  self.x, self.y = self.world:move(self, goalX, goalY)
end

return Block
