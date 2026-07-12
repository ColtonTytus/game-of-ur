# GdUnit generated TestSuite
class_name UrLogicTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source: String = 'res://scripts/logic/ur_logic.gd'

const NL : String = '\n'

var LVLS : UrLogic.LogicCollection = null

func _create_collection() -> void:
	var collection : UrLogic.LogicCollection = UrLogic.LogicCollection.new()
	var first_level : UrLogic.LogicLevel = UrLogic.LogicLevel.new()
	first_level.define_board_cells(
		'1' + NL +
		'2' + NL +
		'3' + NL +
		'2' + NL +
		'1'
	)
	first_level.define_cell_types(
		{
			1 : [UrLogic.LogicTile.TILE_TYPE.REGULAR],
			2 : [UrLogic.LogicTile.TILE_TYPE.REPEAT],
			3 : [
				UrLogic.LogicTile.TILE_TYPE.REPEAT,
				UrLogic.LogicTile.TILE_TYPE.SAFEZONE
			],
		}
	)
	first_level.define_paths(
		[
			'a0,a1,a2,a3,a4',
			'a4,a3,a2,a1,a0'
		],
	)
	collection.add_level(first_level)
	var second_level : UrLogic.LogicLevel = UrLogic.LogicLevel.new()
	second_level.define_board_cells(
		'131' + NL +
		'323' + NL +
		'131'
	)
	second_level.define_cell_types(
		{
			1 : [UrLogic.LogicTile.TILE_TYPE.REGULAR],
			2 : [UrLogic.LogicTile.TILE_TYPE.REPEAT],
			3 : [UrLogic.LogicTile.TILE_TYPE.SAFEZONE],
		}
	)
	second_level.define_paths(
		[
			'a0,a1,b1,b2,c2',
			'c0,b0,b1,c1,a2',
			'c2,c1,b1,a1,a0',
			'a2,b2,b1,b0,c0',
		]
	)
	collection.add_level(second_level)
	var third_level : UrLogic.LogicLevel = UrLogic.LogicLevel.new()
	third_level.define_board_cells(
		'2111--21' + NL +
		'11121111' + NL +
		'2111--21'
	)
	third_level.define_cell_types(
		{
			1 : [UrLogic.LogicTile.TILE_TYPE.REGULAR],
			2 : [UrLogic.LogicTile.TILE_TYPE.REPEAT],
			3 : [
				UrLogic.LogicTile.TILE_TYPE.REPEAT,
				UrLogic.LogicTile.TILE_TYPE.SAFEZONE
			],
		}
	)
	third_level.define_paths(
		[
			'd0,c0,b0,a0,a1,b1,c1,d1,e1,f1,g1,h1,h0,g0',
			'd2,c2,b2,a2,a1,b1,c1,d1,e1,f1,g1,h1,h2,g2',
		]
	)
	collection.add_level(third_level)
	var fourth_level : UrLogic.LogicLevel = UrLogic.LogicLevel.new()
	fourth_level.define_board_cells(
		'2111--21' + NL +
		'11121111' + NL +
		'2111--21'
	)
	fourth_level.define_cell_types(
		{
			1 : [UrLogic.LogicTile.TILE_TYPE.REGULAR],
			2 : [UrLogic.LogicTile.TILE_TYPE.REPEAT],
			3 : [
				UrLogic.LogicTile.TILE_TYPE.REPEAT,
				UrLogic.LogicTile.TILE_TYPE.SAFEZONE
			],
		}
	)
	fourth_level.define_paths(
		[
			'a0,b0,c0,d0,d1,e1,f1,g1,g0,h0,h1,h2,g2,g1,f1,e1,d1,c1,b1,a1',
			'a2,b2,c2,d2,d1,e1,f1,g1,g2,h2,h1,h0,g0,g1,f1,e1,d1,c1,b1,a1',
		]
	)
	collection.add_level(fourth_level)
	var fifth_level : UrLogic.LogicLevel = UrLogic.LogicLevel.new()
	fifth_level.define_board_cells(
		'1111-' + NL +
		'-1-1-' + NL +
		'-1111'
	)
	fifth_level.define_cell_types(
		{
			1 : [UrLogic.LogicTile.TILE_TYPE.REGULAR],
		}
	)
	fifth_level.define_paths_with_branches(
		[
			[
				'a0,b0,c0,d0,d1,d2,e2',
				   'b0,b1,b2,c2,d2',
			],
			[
				'a0,b0,c0,d0,d1,d2,e2',
				   'b0,b1,b2,c2,d2',
			],
		]
	)
	collection.add_level(fifth_level)
	LVLS = collection

# NOTE: next up.
# - get_possible_draws(pips : int) -> LogicDraw. list all possible draws for a dice roll outcome.
# - execute_draw(draw : LogicDraw) -> void. in a level execute draws. query piece positions as test.

########## NOTE: this is a template.
#func test_new_test() -> void:
	## DEFINE.
	#var expected_cell_nums : Array[int] = [5,9,20,20,10]
	#var actual_cell_nums : Array[int] = []
	## EXECUTE.
	#_create_collection()
	#var levels : Array[UrLogic.LogicLevel] = LVLS.get_levels()
	#for level : UrLogic.LogicLevel in levels:
		#var actual_cell_num = level.number_of_cells()
		#actual_cell_nums.append(actual_cell_num)
	## ASSERT.
	#for i : int in len(expected_cell_nums):
		#var expected_cell_num : int = expected_cell_nums[i]
		#var actual_cell_num : int = actual_cell_nums[i]
		#assert_int(actual_cell_num) \
			#.append_failure_message('no. of cells does not match at level #' + str(i)) \
			#.is_equal(expected_cell_num)

func test_get_cell_types() -> void:
	# DEFINE.
	_create_collection()
	var levels : Array[UrLogic.LogicLevel] = LVLS.get_levels()
	var expected_data : Array[Dictionary] = [
			{
				'level' : levels[0],
				'cell'  : Vector2i(0, 0),
				'expected_types'  : [
					UrLogic.LogicTile.TILE_TYPE.REGULAR,
				]
			},
			{
				'level' : levels[0],
				'cell'  : Vector2i(0, 1),
				'expected_types'  : [
					UrLogic.LogicTile.TILE_TYPE.REPEAT,
				]
			},
			{
				'level' : levels[0],
				'cell'  : Vector2i(0, 2),
				'expected_types'  : [
					UrLogic.LogicTile.TILE_TYPE.REPEAT,
					UrLogic.LogicTile.TILE_TYPE.SAFEZONE,
				]
			},
			{
				'level' : levels[1],
				'cell'  : Vector2i(2, 2),
				'expected_types'  : [
					UrLogic.LogicTile.TILE_TYPE.REGULAR,
				]
			},
			{
				'level' : levels[1],
				'cell'  : Vector2i(1, 1),
				'expected_types'  : [
					UrLogic.LogicTile.TILE_TYPE.REPEAT,
					UrLogic.LogicTile.TILE_TYPE.SAFEZONE,
				]
			},
			{
				'level' : levels[1],
				'cell'  : Vector2i(2, 1),
				'expected_types'  : [
					UrLogic.LogicTile.TILE_TYPE.REPEAT,
				]
			},
		]
	var expected_type_arrs : Array[Array] = []
	var actual_type_arrs : Array[Array] = []
	# EXECUTE.
	for data : Dictionary in expected_data:
		var level : UrLogic.LogicLevel = data['level']
		var cell_coords : Vector2i = data['cell']
		var actual_type_arr = level.get_cell_types(cell_coords)
		var expected_type_arr : Array = data['expected_types'] # NOTE: of type Array[UrLogic.LogicTile]
		expected_type_arrs.append(expected_type_arr)
		actual_type_arrs.append(actual_type_arr)
	# ASSERT.
	for i : int in len(expected_type_arrs):
		var expected_type_arr : Array = expected_type_arrs[i] # NOTE: of type Array[UrLogic.LogicTile]
		var actual_type_arr : Array = actual_type_arrs[i] # NOTE: of type Array[UrLogic.LogicTile]
		assert_array(actual_type_arr) \
			.append_failure_message('type array mismatch for test #' + str(i)) \
			.is_equal(expected_type_arr)

func test_level_dimension() -> void:
	# DEFINE.
	var expected_dimensions : Array[Vector2i] = [
		Vector2i(1, 5),
		Vector2i(3, 3),
		Vector2i(8, 3),
		Vector2i(8, 3),
		Vector2i(5, 3)
	]
	var actual_dimensions : Array[Vector2i] = []
	# EXECUTE.
	_create_collection()
	var levels : Array[UrLogic.LogicLevel] = LVLS.get_levels()
	for level : UrLogic.LogicLevel in levels:
		var dimension : Vector2i = level.get_dimension()
		actual_dimensions.append(dimension)
	# ASSERT.
	for i : int in len(expected_dimensions):
		var actual_dimension : Vector2i = actual_dimensions[i]
		var expected_dimension : Vector2i = expected_dimensions[i]
		assert_vector(actual_dimension) \
			.append_failure_message('dimension mismatch at level #' + str(i)) \
			.is_equal(expected_dimension)

func test_level_cell_num() -> void:
	# DEFINE.
	var expected_cell_nums : Array[int] = [5,9,20,20,10]
	var actual_cell_nums   : Array[int] = []
	# EXECUTE.
	_create_collection()
	var levels : Array[UrLogic.LogicLevel] = LVLS.get_levels()
	for level : UrLogic.LogicLevel in levels:
		var actual_cell_num = level.number_of_cells()
		actual_cell_nums.append(actual_cell_num)
	# ASSERT.
	for i : int in len(expected_cell_nums):
		var expected_cell_num : int = expected_cell_nums[i]
		var actual_cell_num : int = actual_cell_nums[i]
		assert_int(actual_cell_num) \
			.append_failure_message('no. of cells does not match at level #' + str(i)) \
			.is_equal(expected_cell_num)
