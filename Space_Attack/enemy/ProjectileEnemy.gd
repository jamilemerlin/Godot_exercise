extends Area2D

export var Damage = 25
export var Speed = 500


func _ready():
	set_as_toplevel(true)


func _process(delta):
	position.y += Speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Projectile_body_entered(body):
	if body.name == "Player":
		body.add_damage(Damage)
		queue_free()
