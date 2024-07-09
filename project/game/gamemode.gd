extends Node

# The game mode manages the state of the game.
# Things like game score, respawning balls, etc
# To reference things, consider using
# 1. Groups: In the Node window, add a group to the desired node. Then you can access in code like get_tree().get_first_node_in_group()
# 2. Unique Names: in Scene window, "RMB | Access as Unique Name" and then can reference like %MyNode.

@onready var ingame_ui = %InGame
@onready var score_label = %ScoreLabel
@onready var highscore_label = %HighScoreLabel
var score = 0
var high_score = 0

const PADDLE_GROUP = &"paddle"	# &"" is a StringName literal. It's for unique strings and is faster for comparisons.
var paddles

const RESPAWN_AREA_GROUP = &"respawn_area"
const PLUNGER_AREA_GROUP = &"plunger_area"
const BALL_SPAWN_GROUP = &"ball_spawn"

const BALL_SCENE = preload("res://game/ball.tscn")
var _ball

func _ready():
	paddles = get_tree().get_nodes_in_group(PADDLE_GROUP)
	
	_spawn_ball()
	
	var respawn_areas = get_tree().get_nodes_in_group(RESPAWN_AREA_GROUP)
	for r in respawn_areas:
		r.body_entered.connect(_on_respawn_ball)
		
	var plunger_areas = get_tree().get_nodes_in_group(PLUNGER_AREA_GROUP)
	for r in plunger_areas:
		r.body_entered.connect(_plungerReady)
	
	var p = ingame_ui
	while p is CanvasItem or p is CanvasLayer:
		p.visible = true
		p = p.get_parent()

func _spawn_ball():
	_ball = BALL_SCENE.instantiate()
	_ball.bonk.connect(_on_paddle_bonk)
	var spawn_point = get_tree().get_first_node_in_group(BALL_SPAWN_GROUP)
	spawn_point.add_child(_ball)

func _on_respawn_ball(ball):
	ball.queue_free()
	high_score = score if score > high_score else high_score
	score = 0
	_update_ui()
	_spawn_ball()
	
func _plungerReady(ball):
	ball.launched = false

func _on_paddle_bonk():
	score += 100
	_update_ui()

func _update_ui():
	highscore_label.text = "High Bonks: %s" % [ high_score ]
	score_label.text = "Bonks: %s" % [ score ]
	
