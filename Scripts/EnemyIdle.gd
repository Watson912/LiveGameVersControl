extends State
class_name EnemyIdle

@export var enemy : CharacterBody3D
var EnemyScript
var enemyScript
var wander_time : float

func randomize_wander():
	var move_direction = enemyScript.get_move_direction()
	move_direction = Vector3(randf_range(-1,1), 0, randf_range(-1,1)).normalized()
	wander_time = randf_range(0, 1)
	
func Enter():
	EnemyScript = load("res://Scripts/enemy.gd")
	enemyScript = EnemyScript.new()
	randomize_wander()
	
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
	else:
		randomize_wander()
		
func Physics_Update(delta: float):
	if enemy:
		move_around(delta)
		
func move_around(time: float):
	
	#move_direction = Vector3(0,0,-1)
	enemy.velocity = enemyScript.get_move_direction() * enemyScript.get_move_speed()
	
