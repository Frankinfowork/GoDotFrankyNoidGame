extends RigidBody2D

onready var break_s : AudioStreamPlayer = get_node("break")
onready var start_s : AudioStreamPlayer = get_node("start")
onready var you_win_s : AudioStreamPlayer = get_node("you_win")
onready var lose_s : AudioStreamPlayer = get_node("lose")
onready var hit_s : AudioStreamPlayer = get_node("hit")

var game_started : bool = false

func _input(event):
	if game_started == false:
		if event.is_action_pressed("iniciar"):
			linear_velocity = Vector2(100,-200)
			game_started = true
			start_s.play()

func _ready():
	pass 

func _physics_process(delta):
	var bodies_folliding = get_colliding_bodies()
	for body in bodies_folliding:
		if body.is_in_group("gr_block"):
			body.queue_free()
			break_s.play()
			if body.get_parent().get_child_count() == 1:
				print("GANAS")
				you_win_s.play()
				get_tree().paused = true
				yield(lose_s,"finished")
				var replay_scn = load("res://title/replay.tscn")
				get_parent().add_child(replay_scn.instance())
				
		elif body.get_name() == "border_bottom":
			print ("PIERDES")
			get_tree().paused = true
			lose_s.play()
			yield(lose_s,"finished")
			queue_free()
			var replay_scn = load("res://title/replay.tscn")
			get_parent().add_child(replay_scn.instance())

		else:
			hit_s.play()
