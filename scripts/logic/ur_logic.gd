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

### An abstraction to unite tiles and areas.
@abstract class LogicLocation:
	### A location's ID.
	var id : int

### The tiles of each game.
class LogicTile extends LogicLocation:
	### Effects a tile can potentially have.
	enum TileType {REGULAR, REPEAT, SAFEZONE}
	### Each tile has its own effects for the piece that lands on it.
	# NOTE some tiles have more than 1 effect, in the traditional game the
	# center piece lets the player repeat a turn, but also acts as a safezone.
	var types : Array[TileType] = []
	### A tile can contain one player's piece at a time or none.
	var current_player : LogicPlayer = null
	### The location each piece has within the board.
	var grid_coords : Vector2i = Vector2i(0, 0)
	### Each logic tile has an actual 3D representation.
	var representation : Node3D

	func _init(p_id: int, p_types: Array[TileType], p_grid_coords: Vector2i) -> void:
		id = p_id
		types = p_types
		grid_coords = p_grid_coords

### The 4 start and end areas for red and blue.
class LogicArea extends LogicLocation:
	### Type of area is either start or end.
	enum AreaType {START, END}
	### The actual type of area.
	var type : AreaType
	### The player who stores pieces here.
	var player : LogicPlayer
	### Number of pieces contained in each area.
	var num_of_pieces : int = 0 # NOTE: usually between 0 and 7.

	func _init(p_id: int, p_type: AreaType, p_player: LogicPlayer) -> void:
		id = p_id
		type = p_type
		player = p_player

### An constallation of tiles is called a board.
class LogicBoard:
	var locations : Array[LogicLocation] = []

	func get_rect() -> Rect2i:
		var start := Vector2i(INT32_MAX, INT32_MAX)
		var end := Vector2i(INT32_MIN, INT32_MIN)

		for location: LogicLocation in locations:
			if location is LogicTile:
				start = start.min(location.grid_coords)
				end = end.max(location.grid_coords + Vector2i(1, 1))

		return Rect2i(start, end - start)

	func get_location_from_id(p_location_id: int) -> LogicLocation:
		var index: int = locations.find_custom(
			func (e: LogicLocation) -> bool:
				return e.id == p_location_id
		)
		assert(index != -1)
		return locations[index]

### Abstraction of a path of nodes (with location id) as DAG (directed acyclic graph).
# NOTE: A path is possibly branching off and merging back in.
class LogicPath:
	### [node id]
	var start_node: int
	### [node id], ascending order
	var _nodes: PackedInt64Array = []
	### {node id : location id}
	var _location_id: Dictionary[int, int] = {}
	### {node id : [node id]}
	var _edges: Dictionary[int, PackedInt64Array] = {}

	### Duplicate; read-only.
	func get_node_ids() -> PackedInt64Array:
		return _nodes.duplicate()

	### Returns `-1` on invalid `p_node_id`.
	func get_node_location_id(p_node_id: int) -> int:
		return _location_id.get(p_node_id, -1)

	### Returns `[]` on invalid `p_node_id`.
	func get_node_edges(p_node_id: int) -> PackedInt64Array:
		return _edges.get(p_node_id, [])

	### Returns node id.
	func add_node(p_location_id: int, p_edges: PackedInt64Array = [], p_start_node: bool = false) -> int:
		for edge: int in p_edges:
			assert(edge in _nodes)

		var id: int = 0
		if _nodes.size():
			# should only happen if function is called INT64_MAX + 1 times
			assert(_nodes[-1] != INT64_MAX)
			id = _nodes[-1] + 1
		_nodes.append(id)
		_location_id[id] = p_location_id
		_edges[id] = p_edges
		if p_start_node:
			start_node = id

		return id

	func add_edge(p_from_node: int, p_to_node: int) -> void:
		assert(p_from_node in _nodes)
		assert(p_to_node in _nodes)
		assert(not p_to_node in get_node_edges(p_from_node))
		_edges[p_from_node].append(p_to_node)

### Togehter with a path for each player it is called a level.
class LogicLevel:
	var temp_cells : String = '' # TODO: remove later.
	### All tiles in a level.
	var board : LogicBoard
	### All players in a level.
	var players : Array[LogicPlayer] = []
	### All players in a level.
	var cell_types : Dictionary = {}
	### Each player's path over the board.
	var paths : Array[LogicPath] = []

	func define_board_cells(cells : String) -> void:
		temp_cells = cells
		board = LogicBoard.new()
		return

	func define_cell_types(_cell_types : Dictionary) -> void:
		cell_types = _cell_types

	func define_paths(_paths : Array[String]) -> void:
		var paths_with_branches : Array[Array] = []
		for s : String in _paths:
			paths_with_branches.append([s])
		define_paths_with_branches(paths_with_branches)

	func define_paths_with_branches(_paths_with_branches : Array[Array]) -> void:
		return # TODO: implement later.

	func number_of_cells() -> int:
		#return len(board.tiles) # TODO: implement later.
		return temp_cells.replace('-', '').replace(Global.NL, '').length()

	func get_dimension() -> Vector2i:
		#return len(board.tiles) # TODO: implement later.
		var length_first_line : int = temp_cells.get_slice(Global.NL, 0).length()
		var num_of_linebreaks : int = temp_cells.split(Global.NL).size()
		return Vector2i(length_first_line, num_of_linebreaks)

	func get_cell_types(cell_coords : Vector2i) -> Array[LogicTile.TileType]:
		#return len(board.tiles) # TODO: implement later.
		var cell_str : String = Global.get_char_at(cell_coords.x, cell_coords.y, temp_cells)
		var types : Array = cell_types[int(cell_str)] # NOTE: left side is of type Array[LogicTile.TileType].
		return types

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
