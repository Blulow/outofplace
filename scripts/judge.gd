extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var ring = $JudgementRing

var bullet : Area2D

func idle() -> void:
	sprite.stop()
	sprite.play("default")

func slap_left() -> void:
	sprite.stop()
	sprite.play("slap_left")
	
	if bullet:
		bullet.fly_left()
	
func slap_right() -> void:
	sprite.stop()
	sprite.play("slap_right")
	
	if bullet:
		bullet.fly_right()

func punch() -> void:
	sprite.stop()
	sprite.play("punch")
	
	if bullet:
		bullet.boom()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		ring.modulate = Color(0, 255, 0)
		bullet = area

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		ring.modulate = Color(255, 255, 255)
		bullet = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("punch"):
		punch()
	elif Input.is_action_just_pressed("slap_left"):
		slap_left()
	elif Input.is_action_just_pressed("slap_right"):
		slap_right()

func _on_animated_sprite_2d_animation_finished() -> void:
	idle()
