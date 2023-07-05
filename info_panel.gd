extends Panel
var store = preload("res://store_panel.tscn").instantiate()
var depot = preload("res://depot_panel.tscn").instantiate()
var factory = preload("res://manufacturing.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update_ui():
	$MoneyLabel.text = "Money: " + str(Game.money)
	$RentLabel.text = "Rent: " + str(Game.rent)
	$MessageLabel.text = ""

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
	

func _on_rent_timer_timeout():
	Game.money = Game.money - Game.rent
	update_ui()
	
func update_message(msg):
	Game.message = msg
	$MessageTimer.start()
	update_ui()
	
func _on_message_timer_timeout():
	Game.message = ''
	update_ui()

	
