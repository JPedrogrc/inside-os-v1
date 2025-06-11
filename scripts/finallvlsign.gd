extends Node2D

@onready var texture: Sprite2D = $texture
@onready var area_sign: Area2D = $area_sign

const lines: Array[String] = [
	"Bom querido aventureiro...", 
	"Chegamos ao fim de nossa jornada", 
	"Foi curta mas inspiradora", 
	"Não aprendemos tudo sobre escalonamento", 
	"mas agora sabemos o básico", 
	"Espero que tenha gostado", 
	"'Isso é tudo pessoal, valeu!'"
]

func _unhandled_input(event):
	if area_sign.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") and not Dialogmanager.is_message_active:
			texture.hide()
			Dialogmanager.start_message(global_position, lines)
	else:
		texture.hide()
		if Dialogmanager.dialog_box and Dialogmanager.dialog_box.is_inside_tree():
			Dialogmanager.dialog_box.queue_free()
			Dialogmanager.is_message_active = false
