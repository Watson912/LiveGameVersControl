extends State
class_name EnemyIdle

@export var enemy : CharacterBody3D
var move_direction : Vector3
var move_speed := 10.0
var wander_time : float

func randomize_wander():
	move_direction = Vector3(randf_range(-1,1), 0, randf_range(-1,1)).normalized()
	wander_time = randf_range(1, 3)
	
func Enter():
	
	randomize_wander()
	
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
	else:
		randomize_wander()
		
	enemy.look_at(Vector3(enemy.velocity.x, enemy.global_position.y, enemy.velocity.z), Vector3.UP)
	
func Physics_Update(delta: float):
	if enemy:
		move_around(delta)
		
func move_around(time: float):
	
	#move_direction = Vector3(0,0,-1)
	enemy.velocity = move_direction * move_speed
	
