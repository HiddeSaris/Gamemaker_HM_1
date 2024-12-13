turning_speed = 0

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
boats = [spr_houte_bootje, spr_kleine_vissers_boot]