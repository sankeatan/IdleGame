extends Panel
var simultaneous_scene = preload("res://store.tscn").instantiate()
var menu_scene = preload("res://menu.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_button_pressed():
	get_tree().get_root().add_child(simultaneous_scene)
	get_tree().change_scene_to_file("res://store.tscn")
