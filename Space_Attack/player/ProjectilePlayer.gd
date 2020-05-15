extends Area2D

export var Damage = 25
export var Speed = 1500
onready var UI_CONTROL = get_node(@"/root/Game/CanvasLayer/Control")


func _ready():
	set_as_toplevel(true)

func _process(delta):
	position.y -= Speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_ProjectilePlayer_body_entered(body):
	if "Enemy" in body.name:
		UI_CONTROL.add_score(10)
		body.queue_free()
		queue_free()
