Guide of installation and use of scene transition manager

How to installit in your project:
	Set the folders in your project.
	Set the scene_manager and scene_transition_manager in autoload.
	In scene_manager.gd replace the main menu const with the route to your main menu scene.

How to use it:
	scene_manager functions:
		load_main_menu:
			loads the main menu scene deleting the old_scene, also can make a transition
		load_scene:
			loads a new scene deleting the old_scene, also can make a transition and pass data between the old_scene and the new_scene if theres a prev_scene saved it will delete it
		save_load_scene
			loads a new scene saving the old_scene, also can make a transition and pass data between the old_scene and the new_scene if theres a prev_scene saved it will delete it
		reload_scene
			reloads a prev_scene saving the old_scene, also can make a transition and pass data between the old_scene and the prev_scene
		load_son_scene
			loads a new scene as a son of another scene in the tree hierarchy and pass data between the father and the son scene.