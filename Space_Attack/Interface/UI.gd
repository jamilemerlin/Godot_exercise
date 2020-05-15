extends Control

const MAX_HEALTH = 100

var score = 0
var game_end = false

func _ready():
	$LifeBar.max_value = MAX_HEALTH
	$LifeBar.value = MAX_HEALTH

func _on_Player_lost_health(health):
	$LifeBar.value = health
	
func add_score(value):
	score += value
	$Score.text = str(score)
	

func _on_Player_ended_game():
	$EndGame.show()
	$RestartGame.show()
	game_end = true
	
func _process(delta):
	if Input.is_action_pressed("restart") and game_end:
		get_tree().reload_current_scene()
		game_end = false
