extends Panel


func update_ui():
	#$GoodsLabel.text = "Goods: " + str(goods)
	#$MoneyLabel.text = "Money: " + str(money)
	#$InStoreLabel.text = "In Store: " + str(in_store)
	#$StoresLabel.text = "Stores: " + str(stores)
	#$FactoryLabel.text = "Factories: " + str(factories)
	#$DepotLabel.text = "Depots: " + str(depots)
	#$CashierLabel.text = "Cashiers: " + str(cashiers)
	#$WorkersLabel.text = "Workers: " + str(workers)
	#$DriversLabel.text = "Drivers: " + str(drivers)
	#$TransportLabel.text = "Transport Space: " + str(transport)
	#$Rentlabel.text = "Rent: " + str(rent)
	#$MessageLabel.text = message
	pass
	
func _ready():
	update_ui()
	$RentTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass






func _on_transport_button_pressed():
	if goods <= 0:
		update_message("No goods in factory!")
	elif goods < transport and depots > 0:
		money = money - drivers
		in_store = in_store + goods
		goods = 0
		update_ui()
	elif depots > 0:
		money = money - drivers
		in_store = in_store + (1+drivers)*depots
		goods = goods - (1+drivers)*depots
		update_ui()
	else:
		money-=1
		goods-=1
		in_store+=1
		update_ui()


func _on_open_store_button_pressed():
	if money < 10+(10*stores):
		update_message("Not enough money!")
	else:
		money = money - 10+(10*stores)
		rent = rent+2+(2*stores)
		stores+=1
		update_ui() 


func _on_open_factory_button_pressed():
	if money < 10+(10*factories):
		update_message("Not enough money!")
	else:
		money = money - 10+(10*factories)
		rent = rent + 2+(2*factories)
		factories+=1
		update_ui() 

func _on_depot_button_pressed():
	if money < 10+(10*depots):
		update_message("Not enough money!")
	else:
		money = money - 10+(10*depots)
		rent = rent + 2+(2*depots)
		depots+=1
		transport = (1+drivers)*depots
		update_ui() 


func _on_hire_cashier_button_pressed():
	if money < 2+(2*cashiers):
		update_message("Not enough money!")
	elif stores == 0:
		update_message("Buy a store!")
	else:
		if cashiers == 0:
			$SellGoodsTimer.start()
		cashiers+=1
		money = money - (2*cashiers)
		rent+=1
		update_ui() 


func _on_hire_worker_button_pressed():
	if money < 2+(2*workers):
		update_message("Not enough money!")
	elif factories == 0:
		update_message("Buy a factory!")
	else:
		if workers == 0:
			$CreateGoodsTimer.start()
		workers+=1
		money = money - (2*workers)
		rent+=1
		update_ui() 

func _on_hire_driver_button_pressed():
	if money < 2+(2*drivers):
		update_message("Not enough money")
	elif depots == 0:
		update_message("Buy a depot!")
	else:
		if drivers == 0:
			$TransportGoodsTimer.start()
		drivers+=1
		money = money - (2*drivers)
		rent+=1
		transport = (1+drivers)*depots
		update_ui()


func _on_sell_goods_timer_timeout():
	_on_sell_goods_button_pressed()
	update_ui()


func _on_rent_timer_timeout():
	money = money - rent
	update_ui() # Replace with function body.


func update_message(msg):
	message = msg
	$MessageTimer.start()
	update_ui()


func _on_create_goods_timer_timeout():
	_on_create_goods_button_pressed()
	update_ui()


func _on_transport_goods_timer_timeout():
	_on_transport_button_pressed()
	update_ui()


func _on_message_timer_timeout():
	message = ''
	update_ui()
