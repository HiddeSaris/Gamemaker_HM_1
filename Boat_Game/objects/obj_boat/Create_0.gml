turning_speed = 0
turning_acceleration = 0.025

max_speed = 0.5
acceleration = 0.002
resistance = 1 - (acceleration / (max_speed + acceleration)) // number 0 - 1, 0.99 = very low resitance, 0.01 = very high resistance
// res = 1 - (acc / (max_sp + acc))
// presets:
// max_sp = 0.5, acc = 0.002, res = 0.996
// max_sp = 1,   acc = 0.005, res = 0.995
// max_sp = 2,   acc = 0.001, res = 0.9995

anchor = false

cur_boat = 0
boats = [spr_houte_bootje, spr_kleine_vissers_boot, spr_middel_vissers_boot, spr_grote_vissers_boot, spr_speedboot]
fishing_rod_pos_boats = [[5, 21], [6, 40], [10, 27]]
person_pos_boats = [[3, 24]]

respawn_x = x
respawn_y = y
respawn_rot = image_angle

respawn_screen = false

fishing = false
image_speed = 0

fishing_rod_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1]) + image_angle
fishing_rod_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1])

person_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]) + image_angle
person_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1])

frame_person = 0
frame_fishing_rod = 0

fishing_rod_animation_timer = 0