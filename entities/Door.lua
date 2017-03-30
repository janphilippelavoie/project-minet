local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'

local Door = Class{
  __includes = Entity
}

function Door:init(world, x, y)
  -- Entity.init(self, world, x, y, self.img:getWidth(), self.img:getHeight())
end

function Door:update(dt)

end

function Door:draw()

end

return Door
