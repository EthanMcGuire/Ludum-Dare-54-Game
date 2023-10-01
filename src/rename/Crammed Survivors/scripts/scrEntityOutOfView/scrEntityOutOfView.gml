/// @function entityOutOfView(entity)
/// @return {Bool} returns true if the entity is out of view.
function entityOutOfView(entity)
{
	with (entity)
	{
		var camX, camY;
		var camWidth, camHeight;
		
		camX = camera_get_view_x(view_camera[0]);
		camY = camera_get_view_y(view_camera[0]);
		camWidth = camera_get_view_width(view_camera[0]);
		camHeight = camera_get_view_height(view_camera[0]);
		
		if (x < camX - sprite_width || x > camX + camWidth + sprite_width || 
			y < camY - sprite_height || y > camY + camHeight + sprite_height)
		{
			return true;	
		}
		
		return false;
	}
}