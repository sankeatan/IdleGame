extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update_ui():
	$GoodsLabel.text = "Goods: " + str(Game.goods)
	$WorkersLabel.text = "Workers: " + str(Game.workers)
	$FactoryLabel.text = "Factories: " + str(Game.factories)
	

func update_message(msg):
	Game.message = msg

func _on_create_goods_button_pressed():
	if Game.money <= 0:
		update_message("Not enough money!")
	elif Game.factories > 0:
		Game.money = Game.money - (1 + Game.workers)
		Game.goods = Game.goods + (1+(Game.factories*Game.workers))
		update_ui()
		Game.update_ui('info') 
		
	else:
		Game.money-=1
		Game.goods+=1
		update_ui()
		Game.update_ui('info') 


func _on_open_factory_button_pressed():
	if Game.money < 10+(10*Game.factories):
		update_message("Not enough money!")
	else:
		Game.money = Game.money - 10+(10*Game.factories)
		Game.rent = Game.rent + 2+(2*Game.factories)
		Game.factories+=1
		update_ui()
		Game.update_ui('info') 
		
func _on_hire_worker_button_pressed():
	if Game.money < 2+(2*Game.workers):
		update_message("Not enough money!")
	elif Game.factories == 0:
		update_message("Buy a factory!")
	else:
		if Game.workers == 0:
			$CreateGoodsTimer.start()
		Game.workers+=1
		Game.money = Game.money - (2*Game.workers)
		Game.rent+=1
		update_ui()
		Game.update_ui('info') 
		
func _on_create_goods_timer_timeout():
	_on_create_goods_button_pressed()
