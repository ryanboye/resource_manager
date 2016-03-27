data:extend({

 {
    type = "item",
    name = "bomber",
    icon = "__BomberTutorial__/graphics/icon_bomber.png",
    flags = { "goes-to-quickbar" },
    subgroup = "ammo",
    place_result="bomber",
    stack_size= 1,
  },
  {
    type= "item",
    name= "bomb",
    icon = "__BomberTutorial__/graphics/icon_bomb.png",
    flags= { "goes-to-main-inventory" },
    subgroup = "ammo",
    order= "c-d-b",
    stack_size= 5,
  }

})