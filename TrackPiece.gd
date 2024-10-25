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
	var sb2d = StaticBody2D.new()
	for i in segments:
		self.add_point(vec.rotated(angularSize/segments*(i+1)))
		print(i)
		if(i>1):
			var cs2d = CollisionShape2D.new()
			var ss2d = SegmentShape2D.new()
			ss2d.a = self.points[i-1]
			ss2d.b = self.points[i]
			cs2d.shape = ss2d
			
			sb2d.add_child(cs2d)
	self.add_child(sb2d)
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
