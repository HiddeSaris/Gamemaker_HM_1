turning_speed = 0;
turning_acceleration = 0.025;
max_speed = 0.5;
acceleration = 0.002;

resistance_1 = 1 - (acceleration / (max_speed + acceleration)); // number 0 - 1, 0.99 = very low resitance, 0.01 = very high resistance
resistance_2 = power(resistance_1, 16);
resistance_3 = power(resistance_1, 32);

anchor = false;

cur_fishing_rod = 0;
fishing_rods = [spr_fishing_rod_lv0, spr_fishing_rod_lv1, spr_fishing_rod_lv2];

cur_boat = 0; // the current boat (index of the list boats)
boats = [spr_houte_bootje, spr_kleine_vissers_boot, spr_middel_vissers_boot, spr_grote_vissers_boot, spr_speedboot]; // all the boats in order of switching
fishing_frame_boats = [23, 22, 27, 27, 22];
fishing_rod_pos_boats = [[5, 11], [10, 33], [3, 27], [3, 49], [3, 21]]; // where is the fishing rod lying per boat
person_pos_boats = [[3, 24], [4, 37], [5, 42], [9, 51], [2, 33]]; // where is the person fishing per boat

respawn_x = x; // where to respawn (default is where it begins)
respawn_y = y; // where to respawn (default is where it begins)
respawn_rot = image_angle;

respawn_screen = false; // is the respawn screen on

fish_in_inventory = [];
catched_fish = 0; // the fish that you catch
fishing = false; // is player fishing
steering = true;
wanting_to_steer = false;
wanting_to_fish = false;
fishing_rod_in = true; // is the rod not thrown
fishing_rod_in_prev = true; // was the rod not thrown the previous frame
fishing_rod_out = false; // is the bobber in the water
fishing_rod_out_prev = false; // was the bobber in the water the previous frame
image_speed = 0; // so the animation stops until i want it to start

fishing_rod_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1]) + image_angle;
fishing_rod_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), fishing_rod_pos_boats[cur_boat][0], fishing_rod_pos_boats[cur_boat][1]);
// calculating where the fishing rod has to be drawn

person_dir = point_direction(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]) + image_angle;
person_len = point_distance(sprite_get_xoffset(boats[cur_boat]), sprite_get_yoffset(boats[cur_boat]), person_pos_boats[cur_boat][0], person_pos_boats[cur_boat][1]);
person_x = 0;
person_y = 0;
// calculating where the person has to be drawn

bobber_dir = point_direction(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0) + image_angle;
bobber_len = point_distance(sprite_get_xoffset(spr_fishing_rod_lv0), sprite_get_yoffset(spr_fishing_rod_lv0), 0, 0);
bobber_x = 0;
bobber_y = 0;
// calculating where the bobber is

motor1_dir = point_direction(sprite_get_xoffset(spr_houte_bootje), sprite_get_yoffset(spr_houte_bootje), sprite_width/2, sprite_height-2) + image_angle;
motor1_len = point_distance(sprite_get_xoffset(spr_houte_bootje), sprite_get_yoffset(spr_houte_bootje), sprite_width/2, sprite_height-2);
motor1_x = x + lengthdir_x(motor1_len, motor1_dir);
motor1_y = y + lengthdir_y(motor1_len, motor1_dir);
// calculating where the particles should be drawn

motor2_dir = point_direction(sprite_get_xoffset(spr_houte_bootje), sprite_get_yoffset(spr_houte_bootje), sprite_width/2, sprite_height-2) + image_angle;
motor2_len = point_distance(sprite_get_xoffset(spr_houte_bootje), sprite_get_yoffset(spr_houte_bootje), sprite_width/2, sprite_height-2);
motor2_x = x + lengthdir_x(motor2_len, motor2_dir);
motor2_y = y + lengthdir_y(motor2_len, motor2_dir);
// calculating where the particles should be drawn

front_boat_dir = point_direction(sprite_get_xoffset(spr_houte_bootje), sprite_get_yoffset(spr_houte_bootje), sprite_width/2, 0) + image_angle;
front_boat_len = point_distance(sprite_get_xoffset(spr_houte_bootje), sprite_get_yoffset(spr_houte_bootje), sprite_width/2, 0);
front_boat_x = x + lengthdir_x(front_boat_len, front_boat_dir);
front_boat_y = y + lengthdir_y(front_boat_len, front_boat_dir);
// calculating where the front of the boat is

bobber_in_water = true;

animation_timer = -1;
animation_frame = sprite_get_number(spr_splash) - floor(animation_timer / 12);

frame_person = 0; // what is the current frame of the animation of the person
frame_fishing_rod = 0; // what is the current frame of the animation of the fishing rod

fishing_rod_animation_timer = -1; // a timer to calculate what frame to draw of the fishing rod animation
fishing_rod_out_frame = 17; // the frame that the bobber is out and so the animation has to be stopped

rod_casting_value = 0; // the timer to cast the rod
rod_casting_time = 1 * 60; // the time in steps it takes to cast the rod

fish_timer = -1
fish_timer_duration = 4 * 60 // time you have to wait for the fish
fish_timer_variation = 2 * 60

fish_on_hook = false
fish_on_hook_timer = -1
fish_on_hook_timer_duration = 2 * 60 // time you have to catch the fish
fish_on_hook_timer_variation = 1 * 60

fishing_game = false

global.p_system = part_system_create_layer("Particle_Layer", true);
global.p_emitter_waves_1 = part_emitter_create(global.p_system);
global.p_emitter_waves_2 = part_emitter_create(global.p_system);
global.p_emitter_splashes_1 = part_emitter_create(global.p_system);
global.p_emitter_splashes_2 = part_emitter_create(global.p_system);
global.pt_water_ripple = part_type_create();
global.pt_splash = part_type_create();
global.pt_waves_1 = part_type_create();
global.pt_waves_2 = part_type_create();

// settings for pt_water_ripple
part_type_sprite(global.pt_water_ripple, spr_splash, true, 1, false);
part_type_shape(global.pt_splash, pt_shape_pixel);
part_type_colour3(global.pt_splash, #9ED6FF, #A0CFFF, #8ECCFF);
part_type_alpha3(global.pt_splash, 1, 1, 0);

// settings for pt_waves
part_type_shape(global.pt_waves_1, pt_shape_line);
part_type_scale(global.pt_waves_1, 0.1, 0.3);
part_type_colour3(global.pt_waves_1, #4891DB, #69AAEF, #88AFE2);
part_type_alpha3(global.pt_waves_1, 0.0, 0.4, 0);
part_type_shape(global.pt_waves_2, pt_shape_line);
part_type_scale(global.pt_waves_2, 0.1, 0.3);
part_type_colour3(global.pt_waves_2, #4891DB, #69AAEF, #88AFE2);
part_type_alpha3(global.pt_waves_2, 0.0, 0.4, 0);