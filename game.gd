extends Panel

#Info Panel Variables
var money = 10
var rent = 0
var message = ''

#Store Variables
var stores = 0
var cashiers = 0
var in_stock = 0

#Transportation Variables
var depots = 0
var drivers = 0
var transport = 1

#Manufacturing Variables
var factories = 0
var workers = 0
var goods = 0
	
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update_ui(panel):
	if panel == 'info':
		$InfoPanel.update_ui()
	elif panel == 'store':
		$StorePanel.update_ui()
	elif panel == 'transport':
		$TransportPanel.update_ui()
	elif panel == 'manufacturing':
		$ManufacturingPanel.update_ui()
	else:
		pass
