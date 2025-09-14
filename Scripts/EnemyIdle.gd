extends State
class_name EnemyIdle

@export var enemy : CharacterBody3D
@export var moveSpeed : float = 10.0


var move_direction : Vector3
var wander_time : float

func randomize_wander():
	#move_direction = Vector3(randf_range(-1,1), 0, randf_range(-1,1)).normalized()
	wander_time = randf_range(0, 1)
	
func Enter():
	randomize_wander()
	
func Update(delta: float):
	print(enemy.velocity)
	if wander_time > 0:
		wander_time -= delta
		
	else:
		pass
		randomize_wander()
		
func Physics_Update(delta: float):
	if enemy:
		move_around(delta)
		
func move_around(time: float):
	
	move_direction = Vector3(0,0,-1)
	enemy.velocity = move_direction * moveSpeed
	

	
