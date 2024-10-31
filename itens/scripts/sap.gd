extends Area2D
class_name Sap

signal item_picked_up

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(_body):
		_body.pick_item("sap")
		queue_free()
