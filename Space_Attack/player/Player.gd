extends KinematicBody2D

const BULLET = preload("res://player/ProjectilePlayer.tscn")
const SPEED = Vector2(350, 0)
const MAX_HEALTH = 100

var health = MAX_HEALTH

signal lost_health(health)
signal ended_game()


func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed('left'):
		move_and_collide(-SPEED * delta)
	elif Input.is_action_pressed('right'):
		move_and_collide(SPEED * delta)
		
func _process(delta):
	if Input.is_action_pressed("shoot") and $Timer.is_stopped():
		$Timer.start()
		_spawn_projectile($LeftGun.global_position)
		_spawn_projectile($RightGun.global_position)
		
func _spawn_projectile(spawn_position):
	var new_projectile = BULLET.instance()
	add_child(new_projectile)
	new_projectile.global_position = spawn_position
	
func add_damage(damage):
	health -= damage
	emit_signal("lost_health", health)
	if health <= 0:
		_die()
		
func _die():
	set_physics_process(false)
	set_process(false)
	emit_signal("ended_game")
	
	
