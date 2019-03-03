require("scalecolor")
data:extend({
  {
    type = "turret",
    name = "behemoth-worm-turret",
    icon = "__base__/graphics/icons/behemoth-worm.png",
    icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 750,
    order="b-b-g",
    subgroup="enemies",
    resistances =
    {
      {
        type = "physical",
        decrease = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        decrease = 3,
        percent = 70
      },
      {
        type = "acid",
        percent = 100
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-1.4, -1.2}, {1.4, 1.2}},
    map_generator_bounding_box = {{-2.4, -2.2}, {2.4, 2.2}},
    selection_box = {{-1.4, -1.2}, {1.4, 1.2}},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "behemoth-worm-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(1.0),
    inventory_size = 2,

    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(experimental_worm_scale, experimental_worm_tint),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(experimental_worm_scale, experimental_worm_tint, "forward"),
    preparing_sound = make_worm_standup_sounds(1),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(experimental_worm_scale, experimental_worm_tint),
    prepared_sound = make_worm_breath(0.8),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(experimental_worm_scale, experimental_worm_tint),
    prepared_alternative_sound = make_worm_roar_alternative(0.8),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(experimental_worm_scale, experimental_worm_tint),
    starting_attack_sound = make_worm_roars(0.95),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(experimental_worm_scale, experimental_worm_tint),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(experimental_worm_scale, experimental_worm_tint, "backward"),
    folding_sound = make_worm_fold_sounds(1),
    integration = worm_integration(experimental_worm_scale),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,

    prepare_range = range_worm_behemoth + prepare_range_worm_behemoth,
    allow_turning_when_starting_attack = true,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "biological",
      damage_modifier = damage_modifier_worm_behemoth,--defined in demo-spitter-projectiles.lua
      cooldown = 4,
      range = range_worm_behemoth,--defined in demo-spitter-projectiles.lua
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(scale_worm_behemoth, scale_worm_behemoth * scale_worm_stream),
      use_shooter_direction = true,

      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream

      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "acid-stream-worm-behemoth",
            duration = 160,
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
    build_base_evolution_requirement = 0.9,
    autoplace = enemy_autoplace.enemy_worm_autoplace(9),
    call_for_help_radius = 100
  },
  {
    type = "corpse",
    name = "experimental-worm-corpse",
    icon = "__base__/graphics/icons/big-worm-corpse.png",
    icon_size = 32,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-c[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "corpse",
    animation = worm_die_animation(experimental_worm_scale, experimental_worm_tint)
  },
})