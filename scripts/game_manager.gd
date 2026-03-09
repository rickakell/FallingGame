extends Node

static var max_distance = 0;
static var current_distance = 0;
static var speed = 0;
static var collisions = 0;
static var game_time = 0;
static var game_start_time = 0;

static var game_completion_time = 0;
static var game_end_collisions = 0;

static var game_complete = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_start_time = Time.get_unix_time_from_system();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_distance = floor(abs(%Player.get_position().y) / 100)
	max_distance = max(current_distance, max_distance)
	$HUD/MaxDistance.text = "Distance: " + str(int(max_distance))

	speed = floor(%Player.velocity.y)
	$HUD/Speed.text = "Speed: " + str(int(speed / 10))

	$HUD/Collisions.text = "Collisions: " + str(%Player.collisions)

	game_time = int(Time.get_unix_time_from_system() - game_start_time)
	$HUD/Time.text = "Time: " + str(game_time)

	if(!game_complete):
		if %Player.get_position().y >= %FinishLine.get_position().y or %Player.get_position().y >= %FinishLine2.get_position().y:
			game_complete = true
			game_completion_time = game_time
			game_end_collisions = %Player.collisions
			$HUD.visible = false
			$EndScreen/CompletionTime.text = "Completion Time: " + str(game_completion_time)
			$EndScreen/TotalCollisions.text = "Total Collisions: " + str(game_end_collisions)
			$EndScreen.visible = true
		
