extends Node

static var max_distance = 0;
static var current_distance = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_distance = floor(abs(%Player.get_position().y) / 100);
	max_distance = max(current_distance, max_distance);
	$HUD/MaxDistance.text = "Max Distance: " + str(int(max_distance));
