extends Area2D

@onready var coin_sfx: AudioStreamPlayer = $coin_sfx as AudioStreamPlayer


func _ready() -> void :
	pass



func _process(delta: float) -> void :
	pass

func _on_body_entered(body: Node2D) -> void :
	$anim.play("collect")
	coin_sfx.play()

func _on_anim_animation_finished() -> void :
	queue_free()
