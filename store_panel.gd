extends Panel

var stores = 0
var cashiers = 0

func _ready():
	update_ui()

func update_ui():
	$InStoreLabel.text = "Stock: " + str(Game.in_stock)
	$CashierLabel.text = "Cashiers: " + str(cashiers)
	$StoresLabel.text = "Stores: " + str(stores)

func update_message(msg):
	Game.message = msg

func _process(delta):
	pass

func _on_sell_goods_button_pressed():
	if Game.in_stock <= 0:
		update_message("No goods in store!")
	elif stores > 0:
		Game.money = Game.money + (3+(cashiers*stores))
		Game.in_stock-=1
		update_ui()
	else:
		Game.money = Game.money + 3
		Game.in_stock-=1
		update_ui()

func _on_open_store_button_pressed():
	if Game.money < 10+(10*stores):
		update_message("Not enough money!")
	else:
		Game.money = Game.money - 10+(10*stores)
		Game.rent = Game.rent+2+(2*stores)
		stores+=1
		update_ui() 
		
func _on_hire_cashier_button_pressed():
	if Game.money < 2+(2*cashiers):
		update_message("Not enough money!")
	elif stores == 0:
		update_message("Buy a store!")
	else:
		if cashiers == 0:
			$SellGoodsTimer.start()
		cashiers+=1
		Game.money = Game.money - (2*cashiers)
		Game.rent+=1
		update_ui() 

func _on_sell_goods_timer_timeout():
	_on_sell_goods_button_pressed()
	update_ui()
