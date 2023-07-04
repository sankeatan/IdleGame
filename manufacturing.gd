extends Panel

var factories = 0
var workers = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ui():
	$GoodsLabel.text = "Goods: " + str(Game.goods)
	$WorkersLabel.text = "Workers: " + str(workers)
	$FactoryLabel.text = "Factories: " + str(factories)
	

func update_message(msg):
	Game.message = msg

func _on_create_goods_button_pressed():
	if Game.money <= 0:
		update_message("Not enough money!")
	elif factories > 0:
		Game.money = Game.money - (1 + workers)
		Game.goods = Game.goods + (1+(factories*workers))
		update_ui()
	else:
		Game.money-=1
		Game.goods+=1
		update_ui()


func _on_open_factory_button_pressed():
	if Game.money < 10+(10*factories):
		update_message("Not enough money!")
	else:
		Game.money = Game.money - 10+(10*factories)
		Game.rent = Game.rent + 2+(2*factories)
		factories+=1
		update_ui() 
		
func _on_hire_worker_button_pressed():
	if Game.money < 2+(2*workers):
		update_message("Not enough money!")
	elif factories == 0:
		update_message("Buy a factory!")
	else:
		if workers == 0:
			$CreateGoodsTimer.start()
		workers+=1
		Game.money = Game.money - (2*workers)
		Game.rent+=1
		update_ui() 
		
func _on_create_goods_timer_timeout():
	_on_create_goods_button_pressed()
	update_ui()
