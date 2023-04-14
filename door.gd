extends StaticBody2D

func _on_area_2d_area_entered(area):
	if $TxProps.visible:
		$TxProps.visible = false
		$TxProps2.visible = true
		set_collision_layer(32)
	else:
		$TxProps.visible = true
		$TxProps2.visible = false
		set_collision_layer(1)

