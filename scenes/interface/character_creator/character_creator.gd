extends Control

@onready var _left_body_button: Button = $VBoxContainer/BodyContainer/Selector/LeftButton
@onready var _right_body_button: Button = $VBoxContainer/BodyContainer/Selector/RightButton
@onready var _left_arm_button: Button = $VBoxContainer/ArmContainer/Selector/LeftButton
@onready var _right_arm_button: Button = $VBoxContainer/ArmContainer/Selector/RightButton
@onready var _left_eyes_button: Button = $VBoxContainer/EyesContainer/Selector/LeftButton
@onready var _right_eyes_button: Button = $VBoxContainer/EyesContainer/Selector/RightButton
@onready var _left_underpart_button: Button = $VBoxContainer/UnderpartContainer/Selector/LeftButton
@onready var _right_underpart_button: Button = $VBoxContainer/UnderpartContainer/Selector/RightButton
@onready var _left_scarf_button: Button = $VBoxContainer/ScarfContainer/Selector/LeftButton
@onready var _right_scarf_button: Button = $VBoxContainer/ScarfContainer/Selector/RightButton

@onready var _body_index_label: Label = $VBoxContainer/BodyContainer/Selector/Value
@onready var _arm_index_label: Label = $VBoxContainer/ArmContainer/Selector/Value
@onready var _eyes_index_label: Label = $VBoxContainer/EyesContainer/Selector/Value
@onready var _underpart_index_label: Label = $VBoxContainer/UnderpartContainer/Selector/Value
@onready var _scarf_index_label: Label = $VBoxContainer/ScarfContainer/Selector/Value

@onready var _skin_color_picker: ColorPickerButton = $VBoxContainer/BodyContainer/ColorPicker
@onready var _eyes_color_picker: ColorPickerButton = $VBoxContainer/EyesContainer/ColorPicker
@onready var _underpart_color_picker: ColorPickerButton = $VBoxContainer/UnderpartContainer/ColorPicker
@onready var _scarf_color_picker: ColorPickerButton = $VBoxContainer/ScarfContainer/ColorPicker

@onready var _nickname_edit: TextEdit = $VBoxContainer/NicknameContainer/NicknameEditor

@onready var _body_sprite_preview: Sprite2D = $CharacterPreview/BodySprite
@onready var _arm_sprite_preview: Sprite2D = $CharacterPreview/ArmSprite
@onready var _eyes_sprite_preview: Sprite2D = $CharacterPreview/EyeSprite
@onready var _underpart_sprite_preview: Sprite2D = $CharacterPreview/UnderpartSprite
@onready var _scarf_sprite_preview: Sprite2D = $CharacterPreview/ScarfSprite

var _current_nickname: String = ""
var _current_body_index: int = 0
var _current_arm_index: int = 0
var _current_eyes_index: int = 0
var _current_scarf_index: int = 0
var _current_underpart_index: int = 0

var _current_skin_color: Color = Color(1, 1, 1)
var _current_eyes_color: Color = Color(0, 1, 0)
var _current_scarf_color: Color = Color(0.5, 0.5, 0.5)
var _current_underpart_color: Color = Color(0.5, 0.5, 0.5)

func _ready() -> void:
	load_values()
	update_values()
	update_preview()

func _process(_delta: float) -> void:
	update_values()
	update_preview()

func load_values() -> void:
	_current_skin_color = DataManagement.data_dictionary.player_skin_color
	_current_eyes_color = DataManagement.data_dictionary.player_eyes_color
	_current_scarf_color = DataManagement.data_dictionary.player_scarf_color
	_current_underpart_color = DataManagement.data_dictionary.player_underpart_color
	
	_skin_color_picker.color = _current_skin_color
	_eyes_color_picker.color = _current_eyes_color
	_scarf_color_picker.color = _current_scarf_color
	_underpart_color_picker.color = _current_underpart_color
func update_values() -> void:
	_current_skin_color = _skin_color_picker.color
	_current_eyes_color = _eyes_color_picker.color
	_current_scarf_color = _scarf_color_picker.color
	_current_underpart_color = _underpart_color_picker.color

func update_preview() -> void:
	_body_sprite_preview.modulate = _current_skin_color
	_arm_sprite_preview.modulate = _current_skin_color
	_scarf_sprite_preview.modulate = _current_scarf_color
	_eyes_sprite_preview.modulate = _current_eyes_color
	_underpart_sprite_preview.modulate = _current_underpart_color
	
	_arm_sprite_preview.frame = _current_arm_index
	_scarf_sprite_preview.frame = _current_scarf_index
	_underpart_sprite_preview.frame = _current_underpart_index
	_eyes_sprite_preview.frame = _current_eyes_index


func _on_left_body_button_up() -> void:
	_current_body_index -= 1
	_body_index_label.text = str(_current_body_index)
func _on_right_body_button_up() -> void:
	_current_body_index += 1
	_body_index_label.text = str(_current_body_index)

func _on_left_eyes_button_up() -> void:
	_current_eyes_index -= 1
	_eyes_index_label.text = str(_current_eyes_index)
func _on_right_eyes_button_up() -> void:
	_current_eyes_index += 1
	_eyes_index_label.text = str(_current_eyes_index)

func _on_left_underpart_button_up() -> void:
	_current_underpart_index -= 1
	_underpart_index_label.text = str(_current_underpart_index)
func _on_right_underpart_button_up() -> void:
	_current_underpart_index += 1
	_underpart_index_label.text = str(_current_underpart_index)

func _on_left_scarf_button_up() -> void:
	_current_scarf_index -= 1
	_scarf_index_label.text = str(_current_scarf_index)
func _on_right_scarf_button_up() -> void:
	_current_scarf_index += 1
	_scarf_index_label.text = str(_current_scarf_index)

func _on_left_arm_button_up() -> void:
	_current_arm_index -= 1
	_arm_index_label.text = str(_current_arm_index)
func _on_right_arm_button_up() -> void:
	_current_arm_index += 1
	_arm_index_label.text = str(_current_arm_index)
