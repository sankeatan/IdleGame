extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update_ui():
	$TransportLabel.text = "Shipping Space: " + str(Game.transport)
	$DepotLabel.text = "Depots: " + str(Game.depots)
	$DriversLabel.text = "Drivers: " + str(Game.drivers)

func update_message(msg):
	Game.message = msg
	
func _on_transport_button_pressed():
	if Game.goods <= 0:
		update_message("No goods in factory!")
	elif Game.goods < Game.transport and Game.depots > 0:
		Game.money = Game.money - Game.drivers
		Game.in_stock = Game.in_stock + Game.goods
		Game.goods = 0
		Game.update_ui('info')
		Game.update_ui('store')
		Game.update_ui('manufacturing')
	elif Game.depots > 0:
		Game.money = Game.money - Game.drivers
		Game.in_stock = Game.in_stock + (1+Game.drivers)*Game.depots
		Game.goods = Game.goods - (1+Game.drivers)*Game.depots
		Game.update_ui('info')
		Game.update_ui('store')
		Game.update_ui('manufacturing')
	else:
		Game.money-=1
		Game.goods-=1
		Game.in_stock+=1
		Game.update_ui('info')
		Game.update_ui('store')
		Game.update_ui('manufacturing')

func _on_depot_button_pressed():
	if Game.money < 10+(10*Game.depots):
		update_message("Not enough money!")
	else:
		Game.money = Game.money - 10+(10*Game.depots)
		Game.rent = Game.rent + 2+(2*Game.depots)
		Game.depots+=1
		Game.transport = (1+Game.drivers)*Game.depots
		update_ui()
		Game.update_ui('info') 
		
func _on_hire_driver_button_pressed():
	if Game.money < 2+(2*Game.drivers):
		update_message("Not enough money")
	elif Game.depots == 0:
		update_message("Buy a depot!")
	else:
		if Game.drivers == 0:
			$TransportGoodsTimer.start()
		Game.drivers+=1
		Game.money = Game.money - (2*Game.drivers)
		Game.rent+=1
		Game.transport = (1+Game.drivers)*Game.depots
		update_ui()
		Game.update_ui('info') 
		
func _on_transport_goods_timer_timeout():
	_on_transport_button_pressed()
	update_ui()
