extends Area2D
class_name Sickle

signal item_picked_up

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	add_to_group("collectible")

func _on_body_entered(body: Node2D):
		queue_free()
		print("Sickle coletado")
