extends GutTest
## Sample test: proves the test runner works and checks the
## pixel-perfect display settings from task 0.4 have not drifted.


func test_runner_works() -> void:
	assert_eq(1 + 1, 2, "Basic maths should work")


func test_game_resolution_is_640_by_360() -> void:
	assert_eq(ProjectSettings.get_setting("display/window/size/viewport_width"), 640)
	assert_eq(ProjectSettings.get_setting("display/window/size/viewport_height"), 360)


func test_scaling_is_whole_numbers_only() -> void:
	assert_eq(ProjectSettings.get_setting("display/window/stretch/scale_mode"), "integer")


func test_textures_use_nearest_neighbour() -> void:
	# 0 = nearest-neighbour filtering, which keeps pixels crisp.
	assert_eq(ProjectSettings.get_setting("rendering/textures/canvas_textures/default_texture_filter"), 0)
