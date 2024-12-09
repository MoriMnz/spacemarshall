extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	stage_change()


func stage_change():
	if Input.is_action_just_pressed("1"):
		$finalcollision.disabled = true
		$firstcollision.disabled = false
		$AnimatedSprite2D.play("stageone")
	elif Input.is_action_just_pressed("2"):
		$finalcollision.disabled = false
		$firstcollision.disabled = true
		$AnimatedSprite2D.play("final")
