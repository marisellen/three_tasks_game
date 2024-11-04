extends CharacterBody2D
class_name NPC

var _state_machine

@export_category("Variables")
@export var _move_speed: float = 64.0
@export var _friction: float = 0.8
@export var _acceleration: float = 0.4

@export_category("Objects")
@export var _animation_tree: AnimationTree = null

@export var initial_direction: String = "down"
var _current_direction: String = initial_direction

func _ready() -> void:
	if _animation_tree:
		_state_machine = _animation_tree.get("parameters/playback")
		_set_idle_direction(_current_direction)
	else:
		push_error("AnimationTree não está atribuído no Inspetor para o NPC")

func _physics_process(_delta: float) -> void:
	_animate()

func _animate() -> void:
	if _animation_tree and _state_machine:
		_set_idle_direction(_current_direction)
		_state_machine.travel("idle")

func _set_idle_direction(direction: String) -> void:
	if _animation_tree:
		match direction:
			"up":
				_animation_tree["parameters/idle/blend_position"] = Vector2(0, -1)
			"down":
				_animation_tree["parameters/idle/blend_position"] = Vector2(0, 1)
			"left":
				_animation_tree["parameters/idle/blend_position"] = Vector2(-1, 0)
			"right":
				_animation_tree["parameters/idle/blend_position"] = Vector2(1, 0)
