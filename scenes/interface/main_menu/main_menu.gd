extends Control

@onready var _steam_name: Label = $SteamPanel/SteamName
@onready var _steam_texture: TextureRect = $SteamPanel/SteamAvatar
@onready var _log_message: Label = $LogMessage
@onready var _steam_not_running_message: Label = $SteamNotRunningMessage
@onready var _steam_panel: Panel = $SteamPanel

var _log_messages: Array[String] = [
	"JOGO INDICADO AO GOTY 2028",
	"JOGO VENCEDOR MELHORES GRAFICOS DE 2002",
	"ESTE JOGO NÃO É INSPIRADO EM NENHUM OUTRO",
	"VOCÊ ESTÁ SOZINHO?",
	"MINECRAFT É BÃO",
	"PÃO",
	"EU SOU A NOITE, EU SOU THE NIGHT",
	"ENGOLE O CHORO, E FAZ O L"
]

func _ready() -> void:
	_log_message.text = _log_messages[randi_range(0, _log_messages.size()-1)]
	
	Steam.steamInit()
	var _steam_running = Steam.isSteamRunning()
	if !_steam_running:
		_steam_not_running_message.show()
		return
	else:
		set_steam_panel_data()

func set_steam_panel_data() -> void:
	_steam_panel.show()
	
	var _user_id = Steam.getSteamID()
	var _name = Steam.getFriendPersonaName(_user_id)

	_steam_name.text = _name
	Steam.avatar_loaded.connect(avatar_loaded)
	Steam.getPlayerAvatar()

func avatar_loaded(id, size, buffer) -> void:
	var _avatar_image = Image.create_from_data(size, size, false, Image.FORMAT_RGBA8, buffer)
	var texture = ImageTexture.create_from_image(_avatar_image)
	_steam_texture.texture = texture

func _on_button_mouse_entered() -> void:
	SoundPlayer.play("button_hover")

func _on_quit_button_up() -> void:
	SoundPlayer.play("button_clicked")
	get_tree().quit()


func _on_character_creator_button_up():
	SoundPlayer.play("button_clicked")
	get_tree().change_scene_to_file("res://scenes/interface/character_creator/character_creator.tscn")
