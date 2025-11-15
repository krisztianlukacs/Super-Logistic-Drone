local e = table.deepcopy(data.raw["logistic-robot"]["logistic-robot"])
e.name = "super-logistic-drone"

-- Darázs-színezés (fekete-sárga)
local wasp_tint = { r = 0.95, g = 0.85, b = 0.1, a = 1 }

local function tint_animation(anim, tint)
  if not anim then return end
  if anim.layers then
    for _, layer in pairs(anim.layers) do
      layer.tint = tint
      if layer.hr_version then
        layer.hr_version.tint = tint
      end
    end
  else
    anim.tint = tint
    if anim.hr_version then
      anim.hr_version.tint = tint
    end
  end
end

tint_animation(e.idle, wasp_tint)
tint_animation(e.in_motion, wasp_tint)
tint_animation(e.idle_with_cargo, wasp_tint)
tint_animation(e.in_motion_with_cargo, wasp_tint)

-- Finom sárgás fény
e.light = {
  intensity = 0.4,
  size = 4,
  color = { r = 1.0, g = 1.0, b = 0.6 }
}

-- Sebesség beolvasása a startup beállításból (alap: 0.5)
local setting = settings.startup["super-logistic-drone-base-speed"]
local base_speed = 0.5
if setting and setting.value then
  base_speed = setting.value
end
e.speed = base_speed

data:extend({e})
