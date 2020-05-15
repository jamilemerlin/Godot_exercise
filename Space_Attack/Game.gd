extends Node

const ENEMY = preload("res://enemy/Enemy.tscn")

var enemies = []

func _ready():
	randomize()

func _spawn_enemy():
	var position_x = int(rand_range(64, 948))
	var position_y = int(rand_range(-256, 0))
	var new_enemy = ENEMY.instance()
	add_child(new_enemy)
	new_enemy.position.x = position_x
	new_enemy.position.y = position_y
	enemies.append(new_enemy)
	
func _spawn_enemies(amount):
	for i in range(amount):
		_spawn_enemy()
	
func _on_Timer_timeout():
	_spawn_enemies(1)
	$Timer.start()
