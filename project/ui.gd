extends CanvasLayer

@onready var ingame_ui = %InGameUI
@onready var lives_label = %LivesLabel
@onready var score_label = %ScoreLabel
@onready var highscore_label = %HighScoreLabel
@onready var mainmenu_ui = %MainMenu
# Called when the node enters the scene tree for the first time.
func _ready():
	print("ui")
	%MainMenu.set_visible(true)
	%OptionsMenu.set_visible(false)
	%PauseMenu.set_visible(false)
	%InGameUI.set_visible(false)
