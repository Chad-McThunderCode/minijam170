extends Line2D
class_name TrackPiece


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _init(r = 11 * round(1 + randf()*20), initialRotation = randf()*2*PI, angularSize = randf()*2*PI, lineWidth = 10):
	var segments = angularSize / PI * 30
	var vec = Vector2(r, 0).rotated(initialRotation)
	self.add_point(vec)
	for i in segments:
		self.add_point(vec.rotated(angularSize/segments*(i+1)))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
