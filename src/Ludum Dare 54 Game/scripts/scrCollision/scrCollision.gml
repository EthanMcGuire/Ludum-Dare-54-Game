/// @function entityCollision(entity, xPos, yPos, object)
/// @param {Real} entity To check collision for
/// @param {Real} xPos X position to check
/// @param {Real} yPos Y position to check
/// @param {Real} object Object to check for
/// @return {Bool} Returns true if the entity is meeting object.
function entityCollision(entity, xPos, yPos, object)
{
	with (entity)
	{
		if (place_meeting(xPos, yPos, object))
		{
			return true;	
		}
	}
	
	return false;
}