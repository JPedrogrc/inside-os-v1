extends Node2D

@onready var texture: Sprite2D = $texture
@onready var area_sign: Area2D = $area_sign

const lines: Array[String] = [
	"Olá Aventureiro!", 
	"Seja Bem-vindo a fase 2!", 
	"o escalonamento da vez é o por Prioridade", 
	"E o que isso significa?", 
	"Certos processos tem uma certa...", 
		"importância maior que os outros", 
	"E por isso, eles tem que ser executados primeiro", 
	"Tá vendo aqueles desenhos?", 
	"Sim, aqueles dos pequenos processos com coroas", 
	"Siga a sequência Ouro, Prata e Cobre", 
	"para passar de fase."
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
