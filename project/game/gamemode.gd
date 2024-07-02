extends Node

# The game mode manages the state of the game.
# Things like game score, respawning balls, etc
# To reference things, consider using
# 1. Groups: In the Node window, add a group to the desired node. Then you can access in code like get_tree().get_first_node_in_group()
# 2. Unique Names: in Scene window, "RMB | Access as Unique Name" and then can reference like %MyNode.

@onready var score_label = %ScoreLabel
var score = 0

const PADDLE_GROUP = &"paddle"	# &"" is a StringName literal. It's for unique strings and is faster for comparisons.
var paddles

func _ready():
	paddles = get_tree().get_nodes_in_group(PADDLE_GROUP)
	for p in paddles:
		p.bonk.connect(_on_paddle_bonk)

func _on_paddle_bonk():
	print("bonk")
	score += 1
	score_label.text = "Bonks: %s" % [ score ]
