
local Entities = require 'entities.Entities'
local Block = require 'entities.Block'
local Player = require 'entities.Player'
local Vortex = require 'entities.Vortex'


local TiledObjectFactory = {}

local factories = {}
local getImportName, extractCoordinates, extractProperties --local functions

factories.player = function(world, object)
  return Player(world, object.x, object.y, object.properties.color)
end

factories.block = function(world, object)
  return Block(world, object.x, object.y, object.properties)
end

factories.vortex = function(world, object)
  return Vortex(world, object.x, object.y, object.properties)
end


function TiledObjectFactory:processEntities(world, mapFile)
  local map = require(getImportName(mapFile))
  local data, width, heigth
  for _, layer in pairs(map.layers) do
    if layer.name == 'entities' then
        data = layer.data
        width = layer.width
        heigth = layer.height
    end
  end
  for index, tileId in pairs(data) do
    if tileId ~= 0 then
      local object = {}
      object.x, object.y = extractCoordinates(index, width, map.tilewidth, map.tileheight)
      object.properties = extractProperties(map, tileId)
      assert(object.properties and object.properties.type, string.format("object with tileId %s has needs to define a valid type", tileId))
      assert(factories[object.properties.type], string.format("No such object type: %s", object.properties.type))
      entity = factories[object.properties.type](world, object)
      Entities:add(entity)
    end
  end
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

getImportName = function(fileName)
  name = fileName:sub(1, -5) --strip .lua
  name = string.gsub(name, '/', '.')
  return name
end

extractCoordinates = function(index, width, tilewidth, tileheight)
  local x = (index % width) * tilewidth - tilewidth
  local y = math.floor(index / width) * tileheight
  return x, y
end

extractProperties = function(map, tileId)
  for _, tileset in ipairs(map.tilesets) do
    for _, tile in ipairs(tileset.tiles) do
      if tileId == tile.id + tileset.firstgid then
        return tile.properties
      end
    end
  end
end


return TiledObjectFactory
