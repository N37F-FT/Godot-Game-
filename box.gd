extends StaticBody2D

func _on_area_2d_area_entered(area):
	$TxProps.visible = false
	$TxProps2.visible = true
