extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.game_first_loadin == true:
		$player.position.x = Global.player_start_posx
		$player.position.y = Global.player_start_posy
	else:
		$player.position.x = Global.player_exit_desert_posx
		$player.position.y = Global.player_exit_desert_posy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scene()

func _on_desert_transition_point_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true


#func _on_desert_transition_point_body_exited(body: Node2D) -> void:
	#if body.has_method("player"):
		#Global.transition_scene = false


func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/desert.tscn")
			Global.game_first_loadin = false
			Global.finish_changescenes()
