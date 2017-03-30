
local Entities = require 'entities.Entities'
local Block = require 'entities.Block'
local Player = require 'entities.Player'
local Vortex = require 'entities.Vortex'


local TiledObjectFactory = {}

local factories = {}

factories.player = function(world, object)
  return Player(world, object.x, object.y, object.properties.color)
end
factories.block = function(world, object)
  return Block(world, object.x, object.y - object.height, object.width, object.height, object.properties)
end

factories.vortex = function(world, object)
  return Vortex(world, object.x, object.y - object.height, object.properties)
end



function TiledObjectFactory:processObjectLayer(world, map, layerName)
  for index, layer in ipairs(map.layers) do
    if layer.name == layerName then
      for _, object in pairs(layer.objects) do
        local type = object.type
        if factories[type] then
          entity = factories[type](world, object)
          Entities:add(entity)
        end
      end
      map:removeLayer(index)
    end
  end
end

return TiledObjectFactory
