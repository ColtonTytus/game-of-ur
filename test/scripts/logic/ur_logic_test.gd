# GdUnit generated TestSuite
class_name UrLogicTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source: String = 'res://scripts/logic/ur_logic.gd'

func test__can_sb_give_me_a_heeeyaa() -> void:
	# DEFINE.
	var expected : String = "Heeyaa"
	# EXECUTE.
	var actual : String = UrLogic.can_sb_give_me_a_heeeyaa()
	# ASSERT.
	assert_str(actual) \
		.append_failure_message("it went wrong") \
		.is_equal(expected)

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
