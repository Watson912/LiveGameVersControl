extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var player = null
var turning = false
var EnemyIdle
var turn_target_angle = 0.0
var move_direction : Vector3
@onready var ray_cast_3d = $"../../RayCast3D"
@onready var shape_cast_3d = $"../../ShapeCast3D"

@export var enemy : CharacterBody3D
@export var moveSpeed : float = 10.0

@onready var head = $head
@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D

func _ready():
	player = get_node(player_path)
	EnemyIdle = load("res://Scripts/EnemyIdle.gd")
	EnemyIdle = EnemyIdle.new()

func _physics_process(delta: float) -> void:
	# Using the navigationAgent3d
	#velocity = Vector3.ZERO
	#nav_agent.set_target_position(player.global_transform.origin)
	#var next_nav_point = nav_agent.get_next_path_position()
	#velocity = (next_nav_point - global_transform.origin).normalized() * SPEED

	#look_at(Vector3(global_position.x + velocity.x, global_position.y, global_position.z + velocity.z), Vector3.UP)
	
	#var facing = -global_transform.basis.tdotz(EnemyIdle.get_move_direction)
	#var fov = cos(deg_to_rad(120))
	#if is_on_wall() and not turning:
		#if shape_cast_3d.is_colliding():
			#if facing > fov: 
				##turn_around(delta)
				#print(velocity)
			#velocity = EnemyIdle.get_move_direction() * moveSpeed
			
	move_and_slide()
	
#func turn_around(delta: float):
	#
	## When the enemy hits the wall, they should stop and turn around before moving again
	#turning = true 
	#var dir = move_direction
	#move_direction = Vector3.ZERO
	#
	#var tween = create_tween()
	#tween.tween_property(enemy, "rotation_degrees", Vector3(0, 90,0), 0.2).as_relative()
	#
	#await tween.finished
	#
	#move_direction * -1
	#turning = false

func get_move_speed():
	return moveSpeed

func get_move_direction():
	return move_direction
