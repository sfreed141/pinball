extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed ti
func _on_back_button_pressed():
	%Settings.set_visible(false)
	%OptionsMenu.set_visible(false) 
	%MainMenu.set_visible(true)

