extends RigidBody2D

var launched = false
@export var launchSpeed: float = 2000

signal bonk()

func _process(delta):
	if (Input.is_action_pressed("slap")) and launched == false:
		launched = true
		var upward_impulse = Vector2(0, -launchSpeed)
		apply_central_impulse(upward_impulse)
		print("Launched")

func _on_body_entered(body):
	if body.is_in_group(&"paddle"):
		bonk.emit()

