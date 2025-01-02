// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fish_drop(probability, table){
// probability is the percent chance to catch a fish
// table is the droptable to pick the fish from
	
randomize()
	
if (probability > 0 && table != noone)
{
	if (irandom_range(1, 100) <= probability)
	{
		// what to drop
		var _drop_table_array = obj_loot_table.drop_table_index[table];
		var _num_of_fish = array_length(_drop_table_array);
		
		// total length of the chance sum
		var _chance_sum = 0;
		var _cur_fish = 0;
		repeat(_num_of_fish)
		{
			// add the chance of the current fish to total
			_chance_sum += obj_loot_table.fish_catalogue[_drop_table_array[_cur_fish], drop_chance]
			
			// go to next fish
			_cur_fish++
		}
		
		// pick a number within the chance sum
		var _drop = irandom_range(1, _chance_sum);
	
		// check what fish the picked number is
		var _verify_sum_end = 0;
		var _verify_sum_begin = 0;
		var _drop_fish_index = noone;
		for (var _i = 0; (_i <= _num_of_fish && _drop_fish_index == noone); _i++)
		{
			_verify_sum_begin = _verify_sum_end;
			_verify_sum_end += obj_loot_table.fish_catalogue[_drop_table_array[_i], drop_chance];
			
			if (_drop >= (1 + _verify_sum_begin) && _drop <= _verify_sum_end)
			{
				_drop_fish_index = obj_loot_table.fish_catalogue[_drop_table_array[_i], drop_name];
			}
		}
		return _drop_fish_index
	}
}
}