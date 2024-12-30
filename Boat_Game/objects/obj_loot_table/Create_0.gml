
#macro drop_object 0 // the object of the fish
#macro drop_chance 1 // the chance to catch the fish
#macro drop_price 2 // the price to sell the fish


// different drop tables
enum drop_tables 
{
	regular,
	special,
	total
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
}

// make a 2d array with all the information per fish
fish_catalogue[1, drop_tables.total] = 0 

#region FISH CATALOGUE

fish_catalogue[@ drop_object, fish.anchovy] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.anchovy] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.anchovy] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.bass] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.bass] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.bass] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.carp] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.carp] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.carp] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.catfish] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.catfish] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.catfish] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.clam] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.clam] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.clam] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.cod] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.cod] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.cod] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.crab] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.crab] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.crab] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.eel] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.eel] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.eel] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.herring] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.herring] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.herring] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.lobster] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.lobster] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.lobster] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.octopus] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.octopus] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.octopus] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.oyster] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.oyster] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.oyster] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.perch] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.perch] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.perch] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.salmon] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.salmon] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.salmon] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.sardine] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.sardine] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.sardine] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.shark] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.shark] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.shark] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.shrimp] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.shrimp] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.shrimp] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.squid] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.squid] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.squid] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.sturgeon] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.sturgeon] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.sturgeon] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.swordfish] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.swordfish] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.swordfish] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.trout] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.trout] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.trout] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.tuna] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.tuna] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.tuna] = 1 // coins you get from selling this fish

fish_catalogue[@ drop_object, fish.whitefish] = 	// obj of that fish
fish_catalogue[@ drop_chance, fish.whitefish] = 10 // percent chance that this fish is catched
fish_catalogue[@ drop_price , fish.whitefish] = 1 // coins you get from selling this fish

#endregion

// drop table content
// put fish indicies into arrays and use those arrays as tables for the fishing loot pool 

drop_table_regular = [fish.cod, fish.salmon] // what fish you can catch in this droptable
drop_table_special = [fish.swordfish, fish.shark]

// index of all tables
drop_table_index = [drop_table_regular, drop_table_special] // in order of the enum drop_tables