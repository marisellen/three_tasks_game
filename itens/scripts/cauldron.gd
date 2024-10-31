extends Area2D
signal new_item_created

func _ready() -> void:
 connect("_on_body_entered")

func _on_body_entered(_body: Node2D):
	if _body.name == "Character" and _body.inventory["water"] and _body.inventory["magicFlower"] and _body.inventory["sap"]:
		_body.inventory = {"water": false, "magicFlower": false, "sap": false}  # Limpa o inventário
		emit_signal("new_item_created")
