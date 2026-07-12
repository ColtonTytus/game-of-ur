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
	fifth_level.define_paths_per_player(
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

func test_create_levels() -> void:
	# DEFINE.
	var expected_cell_nums : Array[int] = [5,9,20,20,10]
	var actual_cell_nums : Array[int] = []
	# EXECUTE.
	_create_collection()
	for level : UrLogic.LogicLevel in LVLS.get_levels():
		var actual_cell_num = level.number_of_cells()
		actual_cell_nums.append(actual_cell_num)
	# ASSERT.
	for i : int in len(expected_cell_nums):
		var expected_cell_num : int = expected_cell_nums[i]
		var actual_cell_num : int = actual_cell_nums[i]
		assert_int(actual_cell_num) \
			.append_failure_message('no. of cells does not match at level #' + str(actual_cell_num)) \
			.is_equal(expected_cell_num)

# NOTE: next up.
# - get_possible_draws(pips : int) -> LogicDraw. list all possible draws for a dice roll outcome.
# - execute_draw(draw : LogicDraw) -> void. in a level execute draws. query piece positions as test.

########## NOTE: this is a template.
#func test__can_sb_give_me_a_heeeyaa() -> void:
	## DEFINE.
	#var expected : String = "Heeyaa"
	## EXECUTE.
	#var actual : String = UrLogic.can_sb_give_me_a_heeeyaa()
	## ASSERT.
	#assert_str(actual) \
		#.append_failure_message("it went wrong") \
		#.is_equal(expected)
