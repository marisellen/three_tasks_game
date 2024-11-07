extends Area2D
class_name NPC

var _state_machine
var dialog_active = false

@export_category("Objects")
@export var _animation_tree: AnimationTree = null

@export var initial_direction: String = "down"
var _current_direction: String = initial_direction

func _ready() -> void:
	if _animation_tree:
		_state_machine = _animation_tree.get("parameters/playback")
		_set_idle_direction(_current_direction)
	$"Dialogo elven".visible = false
	
func _physics_process(_delta: float) -> void:
	_animate()
	
func _on_body_entered(body: Node2D) -> void:
	$"Dialogo elven".show()
	print("tocou")

func _on_body_exited(body: Node2D) -> void:
	$"Dialogo elven".hide()
	print("saiu")

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
