extends KinematicBody2D


const BULLET = preload("res://enemy/ProjectileEnemy.tscn")
const MAX_HEALTH = 100

var health = MAX_HEALTH
var speed = Vector2(0, 120)
var dead = false


func _ready():
	pass


func add_damage(damage):
	health -= damage
	if health <= 0 and not dead:
		dead = true
		$AudioExplosion.play()
		hide()
		# queue_free()

func _spawn_projectile(spawn_position):
	var new_projectile = BULLET.instance()
	get_tree().get_root().add_child(new_projectile)
	new_projectile.global_position = spawn_position
	
func _physics_process(delta):
	var collision_enemy = move_and_collide(speed * delta)
	if collision_enemy != null:
		var player = collision_enemy.get_collider()
		player.add_damage(health)
		queue_free()


func _on_Timer_timeout():
	$Timer.start()
	if not dead:
		_spawn_projectile($LeftGun.global_position)
		_spawn_projectile($RightGun.global_position)
	# $AudioLaser.play()



func _on_AudioExplosion_finished():
	queue_free()
