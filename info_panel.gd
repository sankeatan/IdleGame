extends Panel
var store = preload("res://store_panel.tscn").instantiate()
var depot = preload("res://depot_panel.tscn").instantiate()
var factory = preload("res://manufacturing.tscn").instantiate()

var money = 10
var rent = 0
var message = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_store_button_pressed():
	get_tree().get_root().add_child(store)
	get_tree().change_scene_to_file("res://store_panel.tscn")


func _on_transport_button_pressed():
	get_tree().get_root().add_child(depot)
	get_tree().change_scene_to_file("res://depot_panel.tscn")


func _on_manufacturing_button_pressed():
	get_tree().get_root().add_child(factory)
	get_tree().change_scene_to_file("res://manufacturing.tscn")


func _on_gathering_button_pressed():
	get_tree().get_root().add_child(store)
	get_tree().change_scene_to_file("res://store_panel.tscn")
