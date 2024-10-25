extends Line2D
class_name TrackPiece

var r: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _init(r, initialRotation, angularSize, lineWidth):
	var segments = angularSize / PI * 30
	var vec = Vector2(r, 0).rotated(initialRotation)
	self.add_point(vec)
	self.r = r
	for i in segments:
		self.add_point(vec.rotated(angularSize/segments*(i+1)))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
