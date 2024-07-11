extends Node
var menu_visibility = true
@onready var mainmenu_ui = %UI.mainmenu_ui
@onready var ingame_ui = %UI.ingame_ui
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("toggle_menu"):
		_menu_toggle()
		
func _menu_toggle():
	if menu_visibility:
		mainmenu_ui.set_visible(false)
		ingame_ui.set_visible(true)
		print("=====\ntime to close menu")
		print("menu_visibility is set to " + str(menu_visibility))
	else:
		mainmenu_ui.set_visible(true)
		ingame_ui.set_visible(false)
		print("=====\ntime to show menu")
		print("menu_visibility is set to " + str(menu_visibility))
	
	menu_visibility = !menu_visibility

#func _show_ingame_ui():
	#if menu_visibility == false:
		#ingame_ui.set_visible(true)
