local GUI_NAME = "super_logistic_drone_frame"
local LABEL_NAME = "super_logistic_drone_label"

local function create_gui(player)
  if player.gui.top[GUI_NAME] then
    player.gui.top[GUI_NAME].destroy()
  end
  local frame = player.gui.top.add{type="frame", name=GUI_NAME, direction="horizontal"}
  frame.add{type="label", name=LABEL_NAME, caption="Super drones: 0"}
end

script.on_init(function()
  for _, player in pairs(game.players) do
    create_gui(player)
  end
end)

script.on_configuration_changed(function()
  for _, player in pairs(game.players) do
    create_gui(player)
  end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
  local player = game.get_player(event.player_index)
  if player then
    create_gui(player)
  end
end)

script.on_nth_tick(60, function()
  for _, player in pairs(game.connected_players) do
    local frame = player.gui.top[GUI_NAME]
    if frame and frame.valid then
      local label = frame[LABEL_NAME]
      if label and label.valid then
        local surface = player.surface
        local force = player.force
        local count = 0
        if surface and force then
          local robots = surface.find_entities_filtered{
            name = "super-logistic-drone",
            force = force
          }
          if robots then
            count = #robots
          end
        end
        label.caption = "Super drones: " .. count
      end
    end
  end
end)
