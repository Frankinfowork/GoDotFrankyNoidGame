extends KinematicBody2D


const RIGTH : int = 1
const LEFT : int = -1

export var speed : int = 4

""""
func _input(event):
	if event.is_action_pressed("mover_derecha"):
		position.x = position.x + speed
	if event.is_action_pressed("mover_izquierda"):
		position.x = position.x - speed
			
"""

func _ready():
	pass 


func _physics_process(delta):
	if Input.is_action_pressed("mover_derecha"):
		var mouvement : Vector2 = Vector2(speed,0)
		move_and_collide(mouvement)
	if Input.is_action_pressed("mover_izquierda"):
		var mouvement : Vector2 = Vector2(-speed,0)
		move_and_collide(mouvement)
