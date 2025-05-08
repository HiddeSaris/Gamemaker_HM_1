
#macro drop_sprite 0 // the sprite of the fish
#macro drop_name 1 // the name of the fish
#macro drop_chance 2 // the chance to catch the fish
#macro drop_price 3 // the price to sell the fish
#macro drop_bar_height 4 // the height of the indicator bar in fishing game
#macro drop_move_time 5 // the speed of the fish in fishing game


// different drop tables
enum drop_tables 
{
	regular,
	special
}


// all types of fish you can catch
enum fish 
{
	anchovy,
	bass,
	carp,
	catfish,
	clam,
	cod,
	crab,
	eel,
	herring,
	junk,
	lobster,
	octopus,
	oyster,
	perch,
	salmon,
	sardine,
	shark,
	shrimp,
	squid,
	sturgeon,
	swordfish,
	trout,
	tuna,
	whitefish,
	total
}

// make a 2d array with all the information per fish
for (var _i = 0; _i < fish.total; _i++)
{
	for (var _j = 0; _j < 6; _j++)
	{
		fish_catalogue[_i, _j] = -1
	}
}

#region FISH CATALOGUE

fish_catalogue[@ fish.anchovy, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.anchovy, drop_name      ] = "anchovy" // name of the fish
fish_catalogue[@ fish.anchovy, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.anchovy, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.anchovy, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.anchovy, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.bass, drop_sprite	   ] = noone	// sprite of that fish
fish_catalogue[@ fish.bass, drop_name	   ] = "bass" // name of the fish
fish_catalogue[@ fish.bass, drop_chance	   ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.bass, drop_price	   ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.bass, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.bass, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.carp, drop_sprite	   ] = noone	// sprite of that fish
fish_catalogue[@ fish.carp, drop_name	   ] = "carp" // name of the fish
fish_catalogue[@ fish.carp, drop_chance	   ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.carp, drop_price	   ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.carp, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.carp, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.catfish, drop_sprite	  ] = noone	// sprite of that fish
fish_catalogue[@ fish.catfish, drop_name	  ] = "catfish" // name of the fish
fish_catalogue[@ fish.catfish, drop_chance	  ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.catfish, drop_price	  ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.catfish, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.catfish, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.clam, drop_sprite	   ] = noone	// sprite of that fish
fish_catalogue[@ fish.clam, drop_name	   ] = "clam" // name of the fish
fish_catalogue[@ fish.clam, drop_chance	   ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.clam, drop_price	   ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.clam, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.clam, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.cod, drop_sprite	  ] = noone	// sprite of that fish
fish_catalogue[@ fish.cod, drop_name	  ] = "cod" // name of the fish
fish_catalogue[@ fish.cod, drop_chance	  ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.cod, drop_price	  ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.cod, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.cod, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.crab, drop_sprite	   ] = noone	// sprite of that fish
fish_catalogue[@ fish.crab, drop_name	   ] = "crab" // name of the fish
fish_catalogue[@ fish.crab, drop_chance	   ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.crab, drop_price	   ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.crab, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.crab, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.eel, drop_sprite	  ] = noone	// sprite of that fish
fish_catalogue[@ fish.eel, drop_name	  ] = "eel" // name of the fish
fish_catalogue[@ fish.eel, drop_chance	  ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.eel, drop_price	  ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.eel, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.eel, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.herring, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.herring, drop_name      ] = "herring" // name of the fish
fish_catalogue[@ fish.herring, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.herring, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.herring, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.herring, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.junk, drop_sprite	   ] = noone	// sprite of that fish
fish_catalogue[@ fish.junk, drop_name	   ] = "junk" // name of the fish
fish_catalogue[@ fish.junk, drop_chance	   ] = 20 // percent chance that this fish is catched
fish_catalogue[@ fish.junk, drop_price	   ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.junk, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.junk, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.lobster, drop_sprite	  ] = noone	// sprite of that fish
fish_catalogue[@ fish.lobster, drop_name	  ] = "lobster" // name of the fish
fish_catalogue[@ fish.lobster, drop_chance	  ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.lobster, drop_price	  ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.lobster, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.lobster, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.octopus, drop_sprite	  ] = noone	// sprite of that fish
fish_catalogue[@ fish.octopus, drop_name	  ] = "octopus" // name of the fish
fish_catalogue[@ fish.octopus, drop_chance	  ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.octopus, drop_price	  ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.octopus, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.octopus, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.oyster, drop_sprite	 ] = noone	// sprite of that fish
fish_catalogue[@ fish.oyster, drop_name		 ] = "oyster" // name of the fish
fish_catalogue[@ fish.oyster, drop_chance	 ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.oyster, drop_price	 ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.oyster, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.oyster, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.perch, drop_sprite	] = noone	// sprite of that fish
fish_catalogue[@ fish.perch, drop_name		] = "perch" // name of the fish
fish_catalogue[@ fish.perch, drop_chance	] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.perch, drop_price		] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.perch, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.perch, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.salmon, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.salmon, drop_name      ] = "salmon" // name of the fish
fish_catalogue[@ fish.salmon, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.salmon, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.salmon, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.salmon, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.sardine, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.sardine, drop_name      ] = "sardine" // name of the fish
fish_catalogue[@ fish.sardine, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.sardine, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.sardine, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.sardine, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.shark, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.shark, drop_name      ] = "shark" // name of the fish
fish_catalogue[@ fish.shark, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.shark, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.shark, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.shark, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.shrimp, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.shrimp, drop_name      ] = "shrimp" // name of the fish
fish_catalogue[@ fish.shrimp, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.shrimp, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.shrimp, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.shrimp, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.squid, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.squid, drop_name      ] = "squid" // name of the fish
fish_catalogue[@ fish.squid, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.squid, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.squid, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.squid, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.sturgeon, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.sturgeon, drop_name      ] = "sturgeon" // name of the fish
fish_catalogue[@ fish.sturgeon, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.sturgeon, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.sturgeon, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.sturgeon, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.swordfish, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.swordfish, drop_name      ] = "swordfish" // name of the fish
fish_catalogue[@ fish.swordfish, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.swordfish, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.swordfish, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.swordfish, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.trout, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.trout, drop_name      ] = "trout" // name of the fish
fish_catalogue[@ fish.trout, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.trout, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.trout, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.trout, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.tuna, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.tuna, drop_name      ] = "tuna" // name of the fish
fish_catalogue[@ fish.tuna, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.tuna, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.tuna, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.tuna, drop_move_time ] = 180 // the speed of the fish in fishing game

fish_catalogue[@ fish.whitefish, drop_sprite    ] = noone	// sprite of that fish
fish_catalogue[@ fish.whitefish, drop_name      ] = "whitefish" // name of the fish
fish_catalogue[@ fish.whitefish, drop_chance    ] = 10 // percent chance that this fish is catched
fish_catalogue[@ fish.whitefish, drop_price     ] = 1 // coins you get from selling this fish
fish_catalogue[@ fish.whitefish, drop_bar_height] = 20 // the height of the indicator bar in fishing game
fish_catalogue[@ fish.whitefish, drop_move_time ] = 180 // the speed of the fish in fishing game

#endregion

// drop table content
// put fish indicies into arrays and use those arrays as tables for the fishing loot pool 

drop_table_regular = [fish.cod, fish.salmon, fish.carp, fish.bass, fish.junk]; // what fish you can catch in this droptable
drop_table_special = [fish.swordfish, fish.shark];

// index of all tables
drop_table_index = [drop_table_regular, drop_table_special] // in order of the enum drop_tables