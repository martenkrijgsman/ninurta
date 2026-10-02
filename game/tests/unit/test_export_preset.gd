extends GutTest
## Checks the Windows export preset exists and keeps test-only files out of the build.

const PRESETS_PATH := "res://export_presets.cfg"

var _presets := ConfigFile.new()


func before_all() -> void:
	_presets.load(PRESETS_PATH)


func test_windows_preset_exists() -> void:
	assert_eq(_presets.get_value("preset.0", "platform", ""), "Windows Desktop")


func test_build_is_a_single_exe() -> void:
	assert_true(_presets.get_value("preset.0.options", "binary_format/embed_pck", false))


func test_test_tools_are_left_out_of_the_build() -> void:
	var exclude: String = _presets.get_value("preset.0", "exclude_filter", "")
	assert_string_contains(exclude, "addons/gut/*")
	assert_string_contains(exclude, "tests/*")
