extends Node

const SAVEFILE = "user://SAVEFILE.save"


var game_data = {
	"Nombre" : "",
	"PuntajeMaximo": 0
}

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	print(game_data)

func load_data():
	var file = FileAccess.open(SAVEFILE,FileAccess.READ)
	if file == null:
		save_data()
	else:
		game_data = file.get_var()
	save_data()
	file = null

func save_data():
	var file = FileAccess.open(SAVEFILE,FileAccess.WRITE)
	file.store_var(game_data)
	file = null
	
