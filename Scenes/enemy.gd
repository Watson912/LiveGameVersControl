extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var player = null

@onready var head = $head
@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D

func _ready():
	player = get_node(player_path)


func _physics_process(delta: float) -> void:
	# Using the navigationAgent3d
	#velocity = Vector3.ZERO
	#nav_agent.set_target_position(player.global_transform.origin)
	#var next_nav_point = nav_agent.get_next_path_position()
	#velocity = (next_nav_point - global_transform.origin).normalized() * SPEED

	#look_at(Vector3(global_position.x + velocity.x, global_position.y, global_position.z + velocity.z), Vector3.UP)
	
	move_and_slide()
	
	
	
