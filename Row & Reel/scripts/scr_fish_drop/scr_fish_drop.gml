// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fish_drop(table){
randomize()
	
if (table != noone)
{
	var _drop_table_array = obj_loot_table.drop_table_index[table];
	var _num_of_fish = array_length(_drop_table_array);

	var _chance_sum = 0;
	for (var i=0; i < _num_of_fish; i++)
	{
		_chance_sum += obj_loot_table.fish_catalogue[_drop_table_array[i], drop_chance]
	}
		
	// pick a number within the chance sum
	var _drop = irandom(_chance_sum);
	
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
			_drop_fish_index = _drop_table_array[_i];
		}
	}
	return _drop_fish_index
	
}
}