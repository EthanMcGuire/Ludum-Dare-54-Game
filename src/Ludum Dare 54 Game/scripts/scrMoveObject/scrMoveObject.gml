/// @function moveObject(entity, xMove, yMove)
/// @description Moves a game object and checks for collision
/// @param {ID} entity The entity to move
/// @param {Real} xMove X move amount
/// @param {Real} yMove Y move amount
/// @return {Bool} Returns true if a collision is deteected.
function moveObject(entity, xMove, yMove)
{
	with (entity)
	{
		if (place_meeting(x + xMove, y + yMove, parSolid))
		{
			while (!place_meeting(x + sign(xMove), y + sign(yMove), parSolid))	
			{
				x += sign(xMove);	
				y += sign(yMove);	
			}
			
			return true;
		}
		else
		{
			x += xMove;
			y += yMove;
			
			return false;
		}
	}
}