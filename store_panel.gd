extends Panel

func _ready():
	update_ui()
	
func _process(_delta):
	pass

func update_ui():
	$InStoreLabel.text = "Stock: " + str(Game.in_stock)
	$CashierLabel.text = "Cashiers: " + str(Game.cashiers)
	$StoresLabel.text = "Stores: " + str(Game.stores)

func update_message(msg):
	Game.message = msg


func _on_sell_goods_button_pressed():
	if Game.in_stock <= 0:
		update_message("No goods in store!")
	elif Game.stores > 0:
		Game.money = Game.money + (3+(Game.cashiers*Game.stores))
		Game.in_stock = Game.in_stock - 1
		update_ui()
		Game.update_ui('info')
	else:
		Game.money = Game.money + 3
		Game.in_stock = Game.in_stock - 1
		update_ui()
		Game.update_ui('info') 

func _on_open_store_button_pressed():
	if Game.money < 10+(10*Game.stores):
		update_message("Not enough money!")
	else:
		Game.money = Game.money - 10+(10*Game.stores)
		Game.rent = Game.rent+2+(2*Game.stores)
		Game.stores+=1
		update_ui()
		Game.update_ui('info')  
		
func _on_hire_cashier_button_pressed():
	if Game.money < 2+(2*Game.cashiers):
		update_message("Not enough money!")
	elif Game.stores == 0:
		update_message("Buy a store!")
	else:
		if Game.cashiers == 0:
			$SellGoodsTimer.start()
		Game.cashiers+=1
		Game.money = Game.money - (2*Game.cashiers)
		Game.rent+=1
		update_ui()
		Game.update_ui('info') 

func _on_sell_goods_timer_timeout():
	_on_sell_goods_button_pressed()
	update_ui()
