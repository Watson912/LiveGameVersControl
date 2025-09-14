extends State
class_name EnemyIdle

@export var enemy : CharacterBody3D
@export var moveSpeed : float = 10.0
var turning = false
var turn_target_angle = 0.0
@onready var ray_cast_3d = $"../../RayCast3D"
@onready var shape_cast_3d = $"../../ShapeCast3D"

var move_direction : Vector3
var wander_time : float

func randomize_wander():
	move_direction = Vector3(randf_range(-1,1), 0, randf_range(-1,1)).normalized()
	wander_time = randf_range(0, 1)
	
func Enter():
	#randomize_wander()
	
	print(move_direction)
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
		
	else:
		pass
		randomize_wander()
		
func Physics_Update(delta: float):
	if enemy:
		move_around(delta)
		
	var facing = -enemy.global_transform.basis.tdotz(move_direction)
	var fov = cos(deg_to_rad(120))
	if enemy.is_on_wall() and not turning:
		if shape_cast_3d.is_colliding():
			if facing > fov: 
				print(move_direction)
				turn_around(delta)
		
func move_around(time: float):
	
	move_direction = Vector3(0,0,-1)
	enemy.velocity = move_direction * moveSpeed
	
func turn_around(delta: float):
	
	turning = true 
	var dir = move_direction
	move_direction = Vector3.ZERO
	
	var tween = create_tween()
	tween.tween_property(enemy, "rotation_degrees", Vector3(0, 90,0), 0.2).as_relative()
	
	await get_tree().create_timer(10 * delta).timeout
	
	turning = false
	
