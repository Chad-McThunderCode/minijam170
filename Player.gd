extends CharacterBody2D
class_name Player

var segments: Array

func constructor(segments: Array):
	self.segments = segments

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_floor_stop_on_slope_enabled(false)
	self.set_floor_block_on_wall_enabled(false)

	self.max_slides = 100
	self.floor_block_on_wall = false
	self.floor_constant_speed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.velocity += Vector2(0, 98.1*delta)
	if(move_and_slide()):
		var sc = self.get_last_slide_collision()
		self.velocity = self.velocity.rotated(sc.get_angle())
	
