local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'

local Vortex = Class{
  __includes = Entity -- Ground class inherits our Entity class
}

local images = {}
images.blue = 'assets/tiles/2017-03-27_Tileset_0/vortex_blue.png'
images.red = 'assets/tiles/2017-03-27_Tileset_0/vortex_red.png'
images.green = 'assets/tiles/2017-03-27_Tileset_0/vortex_green.png'
function Vortex:init(world, x, y, properties)
  self.properties = properties
  self.img = love.graphics.newImage(images[properties.color])
  Entity.init(self, world, x, y, self.img:getWidth(), self.img:getHeight())
end

function Vortex:filter(player)
  player.color = self.properties.color
  return 'cross'
end

function Vortex:draw()
  love.graphics.draw(self.img, self.x, self.y)
end

function Vortex:update(dt)
end

return Vortex
