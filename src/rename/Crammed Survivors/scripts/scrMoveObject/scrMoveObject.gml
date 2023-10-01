/// @function moveObject(entity, xMove, yMove, object)
/// @description Moves a game object and checks for collision
/// @param {ID} entity The entity to move
/// @param {Real} xMove X move amount
/// @param {Real} yMove Y move amount
/// @param {ID} object Object to check collisions for.
/// @return {ID} Returns ID of object collided with. Otherwise returns noone.
function moveObject(entity, xMove, yMove, object)
{
	with (entity)
	{
		var collision = false;
		
		if (place_meeting(x + xMove, y, object))
		{
			while (!place_meeting(x + sign(xMove), y, object))	
			{
				x += sign(xMove);		
			}
			
			collision = true;
		}
		else
		{
			x += xMove;
		}
		
		if (place_meeting(x, y + yMove, object))
		{
			while (!place_meeting(x, y + sign(yMove), object))	
			{
				y += sign(yMove);		
			}
			
			collision = true;
		}
		else
		{
			y += yMove;
		}
		
		return collision;
	}
}