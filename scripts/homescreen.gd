extends Control

func _on_start_button_pressed() -> void:
	print("Start button clicked!")
	var result = get_tree().change_scene_to_file("res://scenes/world.tscn")  # Use your scene's exact path
	if result != OK:
		print("Failed to load the scene: ", result)




func _on_quit_button_pressed() -> void:
	get_tree().quit()
