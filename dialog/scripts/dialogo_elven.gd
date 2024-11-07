extends NinePatchRect

func _on_button_pressed() -> void:
	$".".hide()
	$"../Dialogo maid".show()
	print("click")
