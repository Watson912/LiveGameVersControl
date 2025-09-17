extends State
class_name EnemyIdle

@export var enemy : CharacterBody3D
@export var move_speed := 10.0
var move_direction : Vector3
var wander_time : float
@onready var ray_cast: RayCast3D = %rayCast

signal turn_around

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
		enemy.velocity = move_direction * move_speed
	
	if enemy.is_on_wall():
		randomize_wander()
	 
		
