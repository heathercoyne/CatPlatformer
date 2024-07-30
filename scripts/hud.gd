extends Control

func set_time_label(value):
	$TimeLabel.text = "TIME: " +  str(value)
	
func show_time_label(yes: bool):
	if yes:
		$TimeLabel.visible = yes
