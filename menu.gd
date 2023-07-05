extends Panel
var new_game = preload("res://game.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_new_game_button_pressed():
	get_tree().get_root().add_child(new_game)
	get_tree().change_scene_to_file("res://game.tscn")
