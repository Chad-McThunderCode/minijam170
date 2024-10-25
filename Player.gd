extends Node2D
class_name Player

var momentum: Vector2 = Vector2(0, 0)
var segments: Array

func constructor(segments: Array):
	self.segments = segments

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.momentum += Vector2(0, 9.81*delta)
	self.handleCollision()
	self.global_position += self.momentum

func handleCollision():
	var startingPoint = self.global_position
	var endPoint = self.global_position + self.momentum
	for segment in self.segments:
		if(segment.global_position.distance_to(self.global_position) < segment.r):
			print("in range of", segment)
