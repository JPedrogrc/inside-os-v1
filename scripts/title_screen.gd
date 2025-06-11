extends Control



func _ready() -> void :
	pass



func _process(delta: float) -> void :
	pass


func _on_start_btn_pressed() -> void :
	get_tree().change_scene_to_file("res://levels/world_01.tscn")


func _on_credits_btn_pressed() -> void :
	pass


func _on_quit_btn_pressed() -> void :
	get_tree().quit()
