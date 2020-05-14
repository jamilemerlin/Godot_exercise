extends Sprite


func initialize_trunk(left_axe, right_axe):
	if not left_axe:
		$LeftAxe.queue_free()
	if not right_axe:
		$RightAxe.queue_free()

func punched(player_position):
	if player_position > global_position.x:
		$Animation.play("fly_left")
	else:
		$Animation.play("fly_right")
