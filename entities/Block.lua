local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'

local Block = Class{
  __includes = Entity -- Ground class inherits our Entity class
}

function Block:init(world, x, y, width, height, color)
  self.img = love.graphics.newImage('assets/tiles/snow.png')
  assert(width == self.img:getWidth()) -- Checking if tile used in tile editor is the right size
  assert(height == self.img:getHeight())
  Entity.init(self, world, x, y, self.img:getWidth(), self.img:getHeight())
  self.properties = properties
end

function Block:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

function Block:update(dt)
end

function Block:filter(player)
  if player.color == 'red' then
    self.delete = true
    return 'cross'
  end
end

return Block
