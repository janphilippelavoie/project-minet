
local Entities = require 'entities.Entities'
local Block = require 'entities.Block'
local Player = require 'entities.Player'
local Vortex = require 'entities.Vortex'


local TiledHelper = {}

local factories = {}

factories.player = function(world, object)
  local player = Player(world, object.x, object.y, object.properties.color)
  Entities:add(player)
end

factories.block = function(world, object)
  local block = Block(world, object.x, object.y - object.height, object.width, object.height, object.properties)
  Entities:add(block)
end

factories.vortex = function(world, object)
  local vortex = Vortex(world, object.x, object.y - object.height, object.properties)
  Entities:add(vortex)
 end



function TiledHelper:processObjectLayer(world, map, layerName)
  for index, layer in ipairs(map.layers) do
    if layer.name == layerName then
      for _, object in pairs(layer.objects) do
        local type = object.type
        if factories[type] then
          factories[type](world, object)
        end
      end
      map:removeLayer(index)
    end
  end
end

return TiledHelper
