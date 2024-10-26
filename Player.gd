extends CharacterBody2D
class_name Player

var segments: Array
var wasAirborne: float = true
var invert: bool = false

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
		self.wasAirborne = 0
		var sc = self.get_last_slide_collision()
		var direction = sc.get_normal().rotated(PI/2)
		#print(sc.get_collider_shape().shape.a)
		if(self.wasAirborne > 0.2):
			if(sc.get_collider_shape().shape.a.y < sc.get_collider_shape().shape.b.y ):
				self.invert = true
			else:
				self.invert = false
		if(self.invert):
			print("inverted")
			direction = direction.rotated(PI)
		self.velocity = self.velocity.length() * direction
		#self.velocity = self.velocity.rotated(sc.get_angle())
	else:
		self.wasAirborne += delta
	if(Input.is_action_pressed("ui_down")):
		if(self.velocity.y > 0):
			self.velocity.y *= 1 + delta
		else:
			self.velocity.y *= 1 - delta
	
