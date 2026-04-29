extends Node2D

@export var BPM: float = 140.0

@onready var timer = $Timer

signal beat

func _ready() -> void:
	timer.wait_time = 60.0 / BPM

func _on_timer_timeout() -> void:
	beat.emit()
