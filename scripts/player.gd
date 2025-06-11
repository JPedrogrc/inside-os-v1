extends CharacterBody2D

const SPEED = 200.0
const AIR_FRICTION: = 0.5

@export var jump_height: = 64
@export var max_time_to_peak: = 0.5
@onready var jump_sfx: AudioStreamPlayer = $jump_sfx as AudioStreamPlayer

var jump_velocity
var gravity
var fall_gravity
var is_jumping: = false

@onready var animation: = $"Animação" as AnimatedSprite2D

func _ready():
	jump_velocity = (jump_height * 2) / max_time_to_peak
	gravity = (jump_height * 2) / pow(max_time_to_peak, 2)
	fall_gravity = gravity * 2

func _physics_process(delta: float) -> void :
	if not is_on_floor():
		velocity.x = 0


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = - jump_velocity
		is_jumping = true
		jump_sfx.play()
	elif is_on_floor():
		is_jumping = false

	if velocity.y > 0 or not Input.is_action_pressed("ui_accept"):
		velocity.y += fall_gravity * delta
	else:
		velocity.y += gravity * delta


	var direction: = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = lerp(velocity.x, direction * SPEED, AIR_FRICTION)
		if direction != 0:
			animation.scale.x = direction
		if !is_jumping:
			play_animation("runn")
	elif is_jumping:
		play_animation("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		play_animation("idle")

	move_and_slide()

func play_animation(name: String):
	if animation.animation != name:
		animation.play(name)
