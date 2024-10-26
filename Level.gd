extends Node2D
class_name Level

const PLAYER = preload("res://Player.tscn")

var segments: Array = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var totalWidth = 0
	for i in 30:
		#var r = 20 + randf() * 180
		var r = 300
		totalWidth += r
		var piece = TrackPiece.new(r, -PI/4 + randf() * PI/2, PI, 20)
		piece.position = Vector2(totalWidth, 300)
		self.add_child(piece)
		self.segments.push_back(piece)
		totalWidth += r
	var player = PLAYER.instantiate()
	player.global_position=Vector2(300, 0)
	player.constructor(self.segments)
	self.add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
