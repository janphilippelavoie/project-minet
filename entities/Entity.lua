-- Represents a single drawable object
local Class = require 'libs.hump.class'

local Entity = Class{}

function Entity:init(world, x, y, width, heigth)
  self.world = world
  self.x = x
  self.y = y
  self.width = width
  self.heigh = heigth
end

function Entity:getRect()
  return self.x, self.y, self.width, self.height
end

function Entity:draw()
  -- Do nothing by default, but we still have to have something to call
end

function Entity:update(dt)
  -- Do nothing by default, but we still have to have something to call
end

return Entity
