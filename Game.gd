extends Node

signal game_ended

func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_Player_hit_by_axe():
	$Timer.start()


func _on_UI_time_up():
	emit_signal('game_ended')
	$Timer.start()
