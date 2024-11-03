extends Area2D
class_name NPCbutcher

var _player_ref: Character = null

@export var skin_scene: PackedScene
@export var skin_position: Vector2

func _on_body_entered(body: Node2D) -> void:
	print("tocou")
	if GameState.items3_collected.get("Knife") == true:
		body.pick_item("Knife")  
		print("Todos os itens foram coletados.")
		queue_free()
		pick_up()
	else:
		print("Ainda faltam itens a serem coletados.")
	
func pick_up() -> void:
	var skin_scene = load("res://itens/scenes/skin.tscn")
	var skin_instance = skin_scene.instantiate()
	skin_instance.position = position + skin_position
	get_parent().add_child(skin_instance)
	print("item gerado")
	
	#(80, -472) 
