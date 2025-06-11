extends Node2D

@onready var texture: Sprite2D = $texture
@onready var area_sign: Area2D = $area_sign

const lines: Array[String] = [
	"Olá Aventureiro!", 
	"Seja Bem-vindo a fase 3, Round Robin!", 
	"Nunca imaginei que Robin seria", 
	"o nome de algo como esse", 
	"Para mim, tá mais para o nome de alguém", 
	"Aqui cada processo tem um limite de tempo", 
	"para ser executado", 
	"Após isso ele é interrompido", 
	"Você tem 10 segundos para derrotar cada processo", 
	"(O Dev não conseguiu colocar um timer", 
	"então imagine 10 segundos contando a partir de agora!)"
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
