extends AnimatableBody2D

@onready var _base_angle = rotation_degrees
var _tween
const SLAP_ANGLE = 30


func _physics_process(delta):
	if Input.is_action_just_pressed("slap") and not (_tween and _tween.is_running()):
		var target_angle = _base_angle
		if cos(_base_angle) < 0:
			target_angle += SLAP_ANGLE
		else:
			target_angle -= SLAP_ANGLE
		_tween = create_tween()	\
			.set_ease(Tween.EASE_IN_OUT)	\
			.set_trans(Tween.TRANS_BOUNCE)
		_tween.tween_property(self, "rotation_degrees", target_angle, 0.05)
		_tween.tween_property(self, "rotation_degrees", _base_angle, 0.15)
