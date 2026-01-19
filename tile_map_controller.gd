extends TileMap

const main_layer = 0 # Tile map layer index.
const main_atlas_id = 0 # The index for the base tiles in tile map.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_clicked = event.position # The position in global coordinate system of the mouse click.
			var pos_clicked = local_to_map(to_local(global_clicked)) # Translating the global position to the tile map's coordinate system.
			print(pos_clicked)
			var current_atlas_coords = get_cell_atlas_coords(main_layer, pos_clicked) # Gets the selected tile's position in the TileMap.
			var current_tile_alt = get_cell_alternative_tile(main_layer, pos_clicked) # Checks what alternate tile is in use on the selected tile.
			var number_of_alts_for_clicked = tile_set.get_source(main_atlas_id).get_alternative_tiles_count(current_atlas_coords) # Counts how many alternates exist for the type of tile selected.
			set_cell(main_layer, pos_clicked, main_atlas_id, current_atlas_coords, (current_tile_alt + 1 ) % number_of_alts_for_clicked) # Increments the selected tile's alt by 1, wrapping back to beginning using modulo of the total alt count.
