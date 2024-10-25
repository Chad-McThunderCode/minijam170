extends Node2D

var elapsed: float = 0.0;
var spawn: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	match int(round(elapsed)):
		3:
			spawn = 20
			elapsed += 1
		6:
			spawn = 50
			elapsed += 1
		9:
			spawn = 100
			elapsed +=1
	if(spawn > 0):
		var iterations = 1
		if(spawn > 25):
			iterations = 3
		for i in iterations: 
			print("lol")
			spawn -=1
			var segment = TrackPiece.new(round(randf() * 100) * 12, randf() * 2 * PI, PI + randf()*PI, 10)
			segment.position = Vector2(1152/2, 648/2)
			self.add_child(segment)
