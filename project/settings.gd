extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_audio_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	pass # Replace with function body.


func _on_mute_box_toggled(toggled_on):
	AudioServer.set_bus_volume_db(0, 0)
	pass # Replace with function body.


func _on_resolution_box_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
	pass # Replace with function body.


func _on_fullscreen_box_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(3, 0)
	else:
		DisplayServer.window_set_mode(0, 0)
	pass # Replace with function body.
