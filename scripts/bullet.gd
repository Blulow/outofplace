extends Area2D

@export var SPEED: float = 3.0

@onready var sprite = $AnimatedSprite2D
@onready var collision = $CollisionShape2D

var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	velocity.y = 1

func _physics_process(delta: float) -> void:
	position += velocity * SPEED

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func fly_left():
	velocity.y = 0
	velocity.x = -1
	collision.disabled = true
	
func fly_right():
	velocity.y = 0
	velocity.x = 1
	collision.disabled = true
	
func boom():
	velocity.y = 0
	sprite.play("boom")
	collision.disabled = true

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "boom":
		queue_free()
