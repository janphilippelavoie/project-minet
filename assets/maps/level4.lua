return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 18,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 2,
  properties = {},
  tilesets = {
    {
      name = "sheet1",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../tiles/sheet1.png",
      imagewidth = 256,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 64,
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 1,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 2,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 11,
          properties = {
            ["collidable"] = true,
            ["vortex"] = "blue"
          }
        },
        {
          id = 12,
          properties = {
            ["collidable"] = true,
            ["vortex"] = "red"
          }
        },
        {
          id = 20,
          properties = {
            ["collidable"] = true,
            ["vortex"] = "green"
          }
        },
        {
          id = 25,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 28,
          properties = {
            ["collidable"] = true,
            ["isExit"] = true
          }
        },
        {
          id = 37,
          properties = {
            ["collidable"] = true,
            ["magicColor"] = "blue"
          }
        },
        {
          id = 38,
          properties = {
            ["collidable"] = true,
            ["magicColor"] = "green"
          }
        },
        {
          id = 39,
          properties = {
            ["collidable"] = true,
            ["magicColor"] = "red"
          }
        }
      }
    }
  },
  layers = {
    {
      type = "objectgroup",
      name = "meta",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 65,
          y = 490,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["color"] = "blue"
          }
        }
      }
    },
    {
      type = "imagelayer",
      name = "sky",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      image = "../images/plainblue.jpg",
      properties = {}
    },
    {
      type = "tilelayer",
      name = "level",
      x = 0,
      y = 0,
      width = 32,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 12, 0, 0, 0, 0, 13, 0, 0, 0, 0, 12, 0, 0, 0, 0, 13, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 12, 0, 0, 0, 0, 13, 0, 0, 0, 0, 12, 0, 0, 0, 0, 13, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 12, 0, 0, 0, 0, 13, 0, 0, 0, 0, 12, 0, 0, 0, 0, 13, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0,
        0, 40, 40, 40, 40, 40, 38, 38, 38, 38, 38, 40, 40, 40, 40, 40, 38, 38, 38, 38, 38, 40, 40, 40, 40, 40, 38, 38, 38, 38, 38, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
