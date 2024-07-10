extends Area2D

signal bumped(sender)

@export var strength = 2000
@export var points = 200

@onready var bumper_sfx = $BumperSfx

const BUMPER_VFX = preload("res://game/bumper_vfx.tscn")

func _on_body_entered(body):
	if body is RigidBody2D:
		var normal = (body.global_position - global_position).normalized()
		var impulse = normal * strength
		body.apply_central_impulse(impulse)
		bumped.emit(self)

		var tween = create_tween().set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.1)
		tween.tween_property(self, "scale", Vector2(1, 1), 0.1)
		
		var vfx = BUMPER_VFX.instantiate()
		vfx.emitting = true
		vfx.finished.connect(vfx.queue_free)
		add_child(vfx)
		
		_shake_screen()
		
		bumper_sfx.play()

# https://shaggydev.com/2022/02/23/screen-shake-godot/
var _camera
var _rng = RandomNumberGenerator.new()
var _noise = FastNoiseLite.new()
const SHAKE_STRENGTH = 60
const SHAKE_DECAY = 5
const SHAKE_SPEED = 30
var _shake_strength = 0
var _noise_i = 0
func _ready():
	_rng.randomize()
	_noise.seed = _rng.randi()

func _shake_screen():
	_shake_strength = SHAKE_STRENGTH

func _process(delta):
	_shake_strength = lerpf(_shake_strength, 0, SHAKE_DECAY * delta)
	_noise_i += delta * SHAKE_SPEED
	var shake_offset = _shake_strength * Vector2(
		_noise.get_noise_2d(1, _noise_i),
		_noise.get_noise_2d(100, _noise_i)
	)
	if not _camera:
		_camera = get_viewport().get_camera_2d()
	
	_camera.offset = shake_offset
