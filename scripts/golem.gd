extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false

var can_take_damage = true


func _physics_process(delta: float) -> void:
	deal_with_damage()
	update_health()
	
	if player_chase:
		position += (player.position - position)/speed
		
		if Global.golem_dam == true:
			if(player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
				$AnimatedSprite2D.play("side_attack")
			elif (player.position.x - position.x) > 0:
				$AnimatedSprite2D.flip_h = false
				$AnimatedSprite2D.play("side_attack")
			elif player.position.y > position.y:
				# Player is in front
				$AnimatedSprite2D.play("front_attack")
			else:
				$AnimatedSprite2D.play("back_attack")
		else:
			if(player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
				$AnimatedSprite2D.play("run_side")
			elif(player.position.x - position.x) > 0:
				$AnimatedSprite2D.flip_h = false
				$AnimatedSprite2D.play("run_side")
			elif player.position.y > position.y:
				# Player is in front
				$AnimatedSprite2D.play("front_run")
			else:
				$AnimatedSprite2D.play("back_run")
	
	else:
		$AnimatedSprite2D.play("idle_front")


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false

func enemy():
	pass


func _on_orc_1_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = true
		Global.golem_dam = true


func _on_orc_1_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = false
		Global.golem_dam = false

func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		if can_take_damage == true:
			$AnimatedSprite2D.play("front_hurt")
			health = health - 25
			$take_damage_cooldown.start()
			can_take_damage = false
			print("golem health = ", health)
			if health <= 0:
				self.queue_free()


func _on_take_damage_cooldown_timeout() -> void:
	can_take_damage = true

func update_health():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true