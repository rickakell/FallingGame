extends Node

static var max_distance = 0;
static var current_distance = 0;
static var speed = 0;
static var collisions = 0;
static var game_time = 0;
static var game_start_time;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_start_time = Time.get_unix_time_from_system();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_distance = floor(abs(%Player.get_position().y) / 100);
	max_distance = max(current_distance, max_distance);
	$HUD/MaxDistance.text = "Distance: " + str(int(max_distance));

	speed = floor(%Player.velocity.y);
	$HUD/Speed.text = "Speed: " + str(int(speed / 10));

	$HUD/Collisions.text = "Collisions: " + str(%Player.collisions)

	game_time = Time.get_unix_time_from_system() - game_start_time;
	$HUD/Time.text = "Time: " + str(int(game_time));
