extends AnimatedSprite2D

@export var game: Node2D
var bullet_scene: Resource = preload("res://scenes/bullet.tscn")

func _ready() -> void:
	game.beat.connect(_on_beat)
	speed_scale = (sprite_frames.get_frame_count("shoot") - sprite_frames.get_animation_speed("shoot")) / (60 / game.BPM)

func _on_beat() -> void:
	play("shoot")
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
