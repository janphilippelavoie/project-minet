

local SpriteLoader = {}

function SpriteLoader:getQuads(img, quadSizeX, quadSizeY)
  assert(img:getHeight() == quadSizeY, "Spritesheet is not single row")
  local quads = {}
  for i = 1, img:getWidth()/quadSizeX do
    x = i * quadSizeX - quadSizeX
    quads[i] = love.graphics.newQuad(x, 0, quadSizeX, quadSizeY, img:getWidth(), img:getHeight())
  end
  return quads
end


return SpriteLoader
