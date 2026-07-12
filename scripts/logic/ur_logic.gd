extends Node
class_name  UrLogic

#############
# classes   #
#############

### The players playing the game.
class LogicPlayer:
	### The player's ID.
	var id : int = 0
	# The player's iconic color.
	var color : Color = Color()

### The tiles of each game.
class LogicTile:
	### Effects a tile can potentially have.
	enum TILE_TYPE {REGULAR, REPEAT, SAFEZONE}
	### A tile's ID.
	var id : int = 0
	### Each tile has its own effects for the piece that lands on it.
	# NOTE some tiles have more than 1 effect, in the traditional game the
	# center piece lets the player repeat a turn, but also acts as a safezone.
	var types : Array[TILE_TYPE] = []
	### A tile can contain one player's piece at a time or none.
	var current_player : LogicPlayer = null
	### The location each piece has within the board.
	var grid_coords : Vector2i = Vector2i(0, 0)
	### Each logic tile has an actual 3D representation.
	var representation : Node3D

### The 4 start and end areas for red and blue.
class LogicArea:
	### Type of area is either start or end.
	enum AREA_TYPE {START, END}
	### The actual type of area.
	var type : AREA_TYPE
	### The player who stores pieces here.
	var player : LogicPlayer
	### Number of pieces contained in each area.
	var num_of_pieces : int = 0 # NOTE: usually between 0 and 7.

### An abstraction to unite tiles and areas.
class LogicLocation:
	enum LOCATION_TYPE {TILE, AREA}
	var type : LOCATION_TYPE = LOCATION_TYPE.TILE

### An constallation of tiles is called a board.
class LogicBoard:
	var tiles : Array[LogicTile] = []
	func draw_piece(draw : LogicDraw) -> void:
		var from  : LogicTile = draw.from
		var to : LogicTile = draw.to
		to.current_player = from.current_player
		from.current_player = null

### Abstraction of a path of tiles as DAG (directed acyclic graph).
# NOTE: A path is possibly branching off and merging back in.
class LogicPath:
	### The graph's edges.
	var edges : Dictionary = {}
	### Create a link between two tiles.
	func link(from_id : int, to_id : int):
		if !edges.has(from_id):
			edges[from_id] = []
		edges[from_id].append(to_id)
	### Get the list of next tiles.
	func next_tiles(tile_id: int):
		return edges.get(tile_id, [])

### Togehter with a path for each player it is called a level.
class LogicLevel:
	var temp_cells : String = '' # TODO: remove later.
	### All tiles in a level.
	var board : LogicBoard
	### All players in a level.
	var players : Array[LogicPlayer] = []
	### Each player's path over the board.
	var paths : Array[LogicPath] = []
	func define_board_cells(cells : String) -> void:
		temp_cells = cells
		board = LogicBoard.new()
		return
	func define_cell_types(cell_types : Dictionary) -> void:
		return
	func define_paths(paths : Array[String]) -> void:
		return
	func define_paths_with_branches(paths_with_branches : Array[Array]) -> void:
		return
	func number_of_cells() -> int:
		#return len(board.tiles) # TODO: implement later.
		return temp_cells.replace('-', '').replace('\n', '').length()

### A collection of levels.
class LogicCollection:
	### All levels.
	var levels : Array[LogicLevel] = []
	func add_level(level : LogicLevel) -> void:
		levels.append(level)
	func get_levels() -> Array[LogicLevel]:
		return levels

### The player drawing a piece from one tile to another.
class LogicDraw:
	var from : LogicTile
	var to : LogicTile

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

#const XXX : String = ""

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

static func can_sb_give_me_a_heeeyaa() -> String:
	return "Heeyaa"

#############
# functions #
#############

#func _read_another_value() -> String:
#	return XXX
