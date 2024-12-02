extends Node

#Replace this const with your Main menu const
const MAIN_MENU = preload("res://UserInterface/main_menu.tscn")
var prev_scene: Node

#This function return the player to the main menu scene with the option to
# make a transition or not between the old_scene and the main menu
func load_main_menu(old_scene, transition: bool = false): #add parameter animation
	if transition:
		await SceneTransitionManager.transition_from(SceneTransition.mask_dict.Center)
	get_tree().paused = true
	get_tree().change_scene_to_packed(MAIN_MENU)
	old_scene.queue_free()
	if transition:
		await SceneTransitionManager.transition_to(SceneTransition.mask_dict.Center)
	get_tree().paused = false

#This function loads a new scene deleting the old after starting a transition,
# tranfering data between the two scenes and before finishing a transition
func load_scene(old_scene, next_scene, transition: bool = false, animation: CompressedTexture2D = SceneTransition.mask_dict.Center, transfer_data: bool = false):
	get_tree().paused = true
	#check if exists an scene saved and delete it
	if prev_scene:
		prev_scene.queue_free()
		prev_scene = null
	var next_scene_ins = next_scene.instantiate()
	if transition:
		await SceneTransitionManager.transition_from(animation)
	get_tree().root.add_child(next_scene_ins)
	if transfer_data:
		next_scene_ins.level_parameters = old_scene.level_parameters
	old_scene.queue_free()
	if transition:
		await SceneTransitionManager.transition_to(animation)
	get_tree().paused = false

#This function loads a new scene saving the old after starting a transition,
# tranfering data between the two scenes and before finishing a transition
func save_load_scene(save_scene, next_scene, transition: bool = false, animation: CompressedTexture2D = SceneTransition.mask_dict.Center, transfer_data: bool = false):
	#check if exists an scene saved and delete it
	if prev_scene && prev_scene != save_scene:
		prev_scene.queue_free()
		prev_scene = save_scene
	get_tree().paused = true
	var next_scene_ins = next_scene.instantiate()
	if transition:
		await SceneTransitionManager.transition_from(animation)
	get_tree().root.add_child(next_scene_ins)
	if transfer_data:
		next_scene_ins.level_parameters = save_scene.level_parameters
	get_tree().root.remove_child(save_scene)
	if transition:
		await SceneTransitionManager.transition_to(animation)
	get_tree().paused = false

#This function reloads a old scene deleting the old before finishing the transition
func reload_scene(old_scene, transition: bool = false, animation: CompressedTexture2D = SceneTransition.mask_dict.Center, transfer_data: bool = false):
	if prev_scene:
		get_tree().paused = true
		if transition:
			await SceneTransitionManager.transition_from(animation)
		get_tree().root.add_child(prev_scene)
		if transfer_data:
			prev_scene.level_parameters = old_scene.level_parameters
		old_scene.queue_free()
		if transition:
			await SceneTransitionManager.transition_to(animation)
		get_tree().paused = false

func load_son_scene(father ,son_scene, transfer_data: bool = false):
	var son_scene_ins = son_scene.instantiate()
	father.add_child(son_scene_ins)
	if transfer_data:
		son_scene_ins.level_parameters = father.level_parameters
