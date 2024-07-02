extends AnimatableBody2D

# This signal is just an example of how to send information to other nodes without coupling.
# See gamemode.gd
signal bonk()

func _physics_process(delta):
	# TODO replace this with custom action (Project Settings | Input Mapping) and make it move the paddle
	if Input.is_action_just_pressed("ui_accept"):
		bonk.emit()
