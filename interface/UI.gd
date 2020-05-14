extends Control

signal time_up
var score_level = 0
const GAME_TIME = 5


func _ready():
	$TimeLeft.max_value = GAME_TIME
	$TimeLeft.value = GAME_TIME

func _process(delta):
	$TimeLeft.value -= delta
	if $TimeLeft.value <= 0:
		$TimeLeft.value = 0
		emit_signal('time_up')
		set_process(false)


func _on_Player_punched_tree(player_position):
	$TimeLeft.value += 0.25
	score_level += 10
	$ScoreLevel.text = str(score_level)
	
