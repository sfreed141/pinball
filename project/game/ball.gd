extends RigidBody2D

signal bonk()

func _on_body_entered(body):
	if body.is_in_group(&"paddle"):
		bonk.emit()
