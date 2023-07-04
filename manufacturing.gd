extends Panel

var goods = 0
var factories = 0
var workers = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_create_goods_button_pressed():
	if money <= 0:
		update_message("Not enough money!")
	elif factories > 0:
		money = money - (1 + workers)
		goods = goods + (1+(factories*workers))
		update_ui()
	else:
		money-=1
		goods+=1
		update_ui()
