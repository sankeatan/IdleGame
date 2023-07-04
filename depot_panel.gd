extends Panel

var depots = 0
var drivers = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ui():
	$TransportLabel.text = "Shipping Space: " + str(Game.transport)
	$DepotLabel.text = "Depots: " + str(depots)
	$DriversLabel.text = "Drivers: " + str(drivers)

func update_message(msg):
	Game.message = msg
	
func _on_transport_button_pressed():
	if Game.goods <= 0:
		update_message("No goods in factory!")
	elif Game.goods < Game.transport and depots > 0:
		Game.money = Game.money - drivers
		Game.in_store = Game.in_store + Game.goods
		Game.goods = 0
		update_ui()
	elif depots > 0:
		Game.money = Game.money - drivers
		Game.in_store = Game.in_store + (1+drivers)*depots
		Game.goods = Game.goods - (1+drivers)*depots
		update_ui()
	else:
		Game.money-=1
		Game.goods-=1
		Game.in_store+=1
		update_ui()

func _on_depot_button_pressed():
	if Game.money < 10+(10*depots):
		update_message("Not enough money!")
	else:
		Game.money = Game.money - 10+(10*depots)
		Game.rent = Game.rent + 2+(2*depots)
		depots+=1
		Game.transport = (1+drivers)*depots
		update_ui() 
		
func _on_hire_driver_button_pressed():
	if Game.money < 2+(2*drivers):
		update_message("Not enough money")
	elif depots == 0:
		update_message("Buy a depot!")
	else:
		if drivers == 0:
			$TransportGoodsTimer.start()
		drivers+=1
		Game.money = Game.money - (2*drivers)
		Game.rent+=1
		Game.transport = (1+drivers)*depots
		update_ui()
		
func _on_transport_goods_timer_timeout():
	_on_transport_button_pressed()
	update_ui()
