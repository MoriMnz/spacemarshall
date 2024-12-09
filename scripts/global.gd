extends Node

var player_current_attack = false

var current_scene = "world" # world cliff side
var transition_scene = false

var player_exit_desert_posx = 417
var player_exit_desert_posy = 9

var player_start_posx = 37
var player_start_posy = 124

var game_first_loadin = true

var golem_dam = false
var orc1_dam = false

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "desert"
		else:
			current_scene = "world"
	
