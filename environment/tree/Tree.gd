extends Position2D

const TRUNK = preload("res://environment/tree/Trunk.tscn")

var trunks = []
var last_has_left_axe = false
var last_has_right_axe = false

func _ready():
	randomize()
	_spawn_first_trunks()

func _spawn_first_trunks():
	for i in range(5):
		var trunk = TRUNK.instance()
		add_child(trunk)
		trunk.position.y -= i * 256
		trunk.initialize_trunk(false, false)
		trunks.append(trunk)

func _add_new_trunk():
	var new_trunk = TRUNK.instance()
	add_child(new_trunk)
	new_trunk.position.y = trunks[trunks.size() - 1].position.y - 256
	var left_axe = false if last_has_right_axe else _get_random_chance()
	var right_axe = false if last_has_left_axe else _get_random_chance() and not left_axe
	last_has_left_axe = left_axe
	last_has_right_axe = right_axe
	new_trunk.initialize_trunk(left_axe, right_axe)
	trunks.append(new_trunk)

func _on_Player_punched_tree(player_position):
	_add_new_trunk()
	trunks[0].punched(player_position)
	trunks.pop_front()
	for trunk in trunks:
		trunk.position.y += 256

func _get_random_chance():
	return rand_range(0, 100) > 50
