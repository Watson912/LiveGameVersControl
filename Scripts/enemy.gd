extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var turning = false
var move_direction : Vector3
@export var enemy : CharacterBody3D


var turn_speed := 1.0

func _ready():
	pass 
	
func _physics_process(delta: float) -> void:
	
	
	
	move_and_slide()
	
