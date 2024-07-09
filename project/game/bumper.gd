extends Area2D

signal bumped(sender)

@export var strength = 2000
@export var points = 200

const BUMPER_VFX = preload("res://game/bumper_vfx.tscn")

func _on_body_entered(body):
	if body is RigidBody2D:
		var normal = (body.global_position - global_position).normalized()
		var impulse = normal * strength
		body.apply_central_impulse(impulse)
		bumped.emit(self)

		var tween = create_tween().set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.1)
		tween.tween_property(self, "scale", Vector2(1, 1), 0.1)
		
		var vfx = BUMPER_VFX.instantiate()
		vfx.emitting = true
		vfx.finished.connect(vfx.queue_free)
		add_child(vfx)
