extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_restart_game_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_options_button_pressed():
	%MainMenu.set_visible(false)
	%Settings.set_visible(true)
	%OptionsMenu.set_visible(true)


func _on_exit_button_pressed():
	get_tree().quit()
