extends Panel

var in_store = 0
var stores = 0
var cashiers = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_sell_goods_button_pressed():
	if in_store <= 0:
		update_message("No goods in store!")
	elif stores > 0:
		emit_signal() money + (3+(cashiers*stores))
		in_store-=1
		update_ui()
	else:
		money = money + 3
		in_store-=1
		update_ui()
