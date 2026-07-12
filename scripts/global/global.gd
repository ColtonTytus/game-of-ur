extends Node
class_name  Global

#############
# signals   #
#############

#signal say_hello

#############
# enums     #
#############

#enum MYVALUE {A, B, C}

#############
# constants #
#############

const NL : String = '\n'

#############
# exports   #
#############

#@export var yyy : String = ""

#############
# on-readys #
#############

#@onready var zzz : String = ""

#############
# varaibles #
#############

#var xxx : String = ""

#############
# build-ins #
#############

#func _ready() -> void:
	#pass


#func _process(delta: float) -> void:
	#pass

#############
# listeners #
#############

#func _on_button_press() -> void:
#	pass

#############
# publics   #
#############

static func get_char_at(x : int, y : int, multi_line_string : String) -> String:
	var lines = multi_line_string.strip_edges().split(NL)
	if y < 0 or y >= lines.size():
		return ''
	if x < 0 or x >= lines[y].length():
		return ''
	return lines[y][x]

#############
# functions #
#############

#func _read_another_value() -> String:
#	return XXX
