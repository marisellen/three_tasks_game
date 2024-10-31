extends Area2D
class_name Teletransport 

var _player_ref: Character = null

@export_category("Variables")
@export var target_position: Vector2

@export_category("Objects")
@export var _animation: AnimationPlayer = null

func _on_body_entered(_body: Node2D)-> void:
	if _body is Character: 
		_body.position = target_position
		print("entra")
