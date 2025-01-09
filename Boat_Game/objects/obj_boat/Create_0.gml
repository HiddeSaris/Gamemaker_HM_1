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

cur_fishing_rod = 0
fishing_rods = [spr_fishing_rod_lv0, spr_fishing_rod_lv1, spr_fishing_rod_lv2]

cur_boat = 0 // the current boat (index of the list boats)
boats = [spr_houte_bootje, spr_kleine_vissers_boot, spr_middel_vissers_boot, spr_grote_vissers_boot, spr_speedboot] // all the boats in order of switching
fishing_rod_pos_boats = [[5, 11], [5, 32], [3, 38], [3, 49], [3, 30]] // where is the fishing rod lying per boat
person_pos_boats = [[3, 24], [4, 37], [5, 42], [9, 51], [2, 33]] // where is the person fishing per boat

respawn_x = x // where to respawn (default is where it begins)
respawn_y = y // where to respawn (default is where it begins)
respawn_rot = image_angle

respawn_screen = false // is the respawn screen on

fish_in_inventory = []
catched_fish = 0 // the fish that you catch
fishing = false // is player fishing
fishing_rod_in = true // is the rod not thrown
fishing_rod_in_prev = true // was the rod not thrown the previous frame
fishing_rod_out = false // is the bobber in the water
fishing_rod_out_prev = false // was the bobber in the water the previous frame
image_speed = 0 // so the animation stops until i want it to start

fishing_rod_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1]) + image_angle
fishing_rod_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1])
// calculating where the fishing rod has to be drawn

person_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]) + image_angle
person_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1])
person_x = 0
person_y = 0
// calculating where the person has to be drawn

bobber_dir = point_direction(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0) + image_angle
bobber_len = point_distance(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0)
bobber_x = 0
bobber_y = 0
// calculating where the bobber is

bobber_in_water = true

animation_timer = -1
animation_frame = sprite_get_number(spr_splash) - floor(animation_timer / 12)

frame_person = 0 // what is the current frame of the animation of the person
frame_fishing_rod = 0 // what is the current frame of the animation of the fishing rod

fishing_rod_animation_timer = -1 // a timer to calculate what frame to draw of the fishing rod animation
fishing_rod_out_frame = 17 // the frame that the bobber is out and so the animation has to be stopped