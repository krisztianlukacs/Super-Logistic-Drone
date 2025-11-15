data:extend({
  {
    type = "technology",
    name = "super-logistic-drone-tech",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256,
    prerequisites = {"logistic-robotics"},
    effects = {
      { type = "unlock-recipe", recipe = "super-logistic-drone" }
    },
    unit = {
      count = 1,
      ingredients = {
        {"automation-science-pack", 500},
        {"logistic-science-pack", 500},
        {"metallurgic-science-pack", 100}
      },
      time = 30
    }
  }
})
