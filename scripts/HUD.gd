extends CanvasLayer
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_maxPoints():
	$MaxScore.text = str(Save.game_data.PuntajeMaximo)
	$MaxScoreTitle.show()
	$MaxScore.show()

func hide_maxPoints():
	$MaxScoreTitle.hide()
	$MaxScore.hide()
	
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_start_button_pressed(): #signal
	start_game.emit()


func _on_message_timer_timeout():
	$Message.hide()



func agregarNombre():
	var nombre = $NombreInp.text
	Save.game_data.Nombre = nombre
	Save.save_data()
	print(Save.game_data)
	

func _on_nombre_btn_pressed():
	agregarNombre()
