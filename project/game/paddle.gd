extends AnimatableBody2D

@onready var _base_angle = rotation_degrees
var _tween
@export var SLAP_ANGLE = 50
@export var slapSpeed = 45

var _is_left

func _ready():
	_is_left = cos(_base_angle) > 0

func _physics_process(delta):
	var target_angle = _base_angle
	var slap = (_is_left and Input.is_action_pressed("left")) or (not _is_left and Input.is_action_pressed("right"))
	if slap:
		if cos(_base_angle) < 0:
			target_angle += SLAP_ANGLE
		else:
			target_angle -= SLAP_ANGLE
	
	rotation = lerp_angle(rotation, deg_to_rad(target_angle), slapSpeed * delta)
	
