extends Area2D

signal bumped(sender)

@export var strength = 1000
@export var points = 200

func _on_body_entered(body):
	if body is RigidBody2D:
		var normal = (body.global_position - global_position).normalized()
		var impulse = normal * strength
		body.apply_central_impulse(impulse)
		bumped.emit(self)
