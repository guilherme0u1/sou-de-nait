extends Node

@onready var _button_hover_sound: AudioStreamPlayer = $ButtonHoverSound
@onready var _button_clicked_sound: AudioStreamPlayer = $ButtonClickedSound

func play(_text: String) -> void:
	match _text:
		"button_clicked":
			_button_clicked_sound.playing = true
		"button_hover":
			_button_hover_sound.playing = true
