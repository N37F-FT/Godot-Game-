extends StaticBody2D

func _on_area_2d_area_entered(_area):
	$AnimationPlayer.play("FadeOut")


func _on_area_2d_area_exited(_area):
	$AnimationPlayer.play_backwards("FadeOut")
	
