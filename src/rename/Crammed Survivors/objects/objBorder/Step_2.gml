/// @description Clamp the play in the border

with (objPlayer)
{
	var bboxW, bboxH;
	
	bboxW = bbox_right - 1 - bbox_left;
	bboxH = bbox_bottom - 1 - bbox_top;
	
	x = clamp(x, other.x + bboxW / 2, other.x + other.width - bboxW / 2);	
	y = clamp(y, other.y + bboxH / 2, other.y + other.height - bboxH / 2);	
}