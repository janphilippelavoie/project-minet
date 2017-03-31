local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local SpriteLoader = require 'helpers.SpriteLoader'

local Block = Class{
  __includes = Entity -- Ground class inherits our Entity class
}

function Block:init(world, x, y, properties)
  self.img = love.graphics.newImage('assets/tiles/blocks.png')
  self.quads = SpriteLoader:getQuads(self.img, TILE_SIZE, TILE_SIZE)
  Entity.init(self, world, x, y, TILE_SIZE, TILE_SIZE)
  self.properties = properties
end

function Block:draw()
  love.graphics.draw(self.img, self.quads[self:getFrame()], self.x, self.y)
end

function Block:update(dt)
end

function Block:filter(player)
  if player.color == 'red' and self.properties.breakable then
    self.delete = true
    return 'cross'
  elseif self.properties.color == player.color then
    return 'cross'
  end
end

function Block:getFrame()
  if self.properties.breakable then
    return 1
  elseif self.properties.color == 'blue' then
    return 2
  elseif self.properties.color == 'green' then
    return 3
  elseif self.properties.color == 'red' then
    return 4
  end
end

return Block
