/// @function drawTextOutline(x, y, text, textColor, outlineColor)
/// @param {Real} x X draw
/// @param {Real} y Y draw
/// @param {Real} text Text to draw
/// @param {Real} textColor Text color
/// @param {Real} outlineColor Outline color
function drawTextOutline(x, y, text, textColor, outlineColor)
{
	//Outline
	draw_set_color(outlineColor)
	draw_text(x + 1, y, text);
	draw_text(x - 1, y, text);
	draw_text(x, y + 1, text);
	draw_text(x, y + 1, text);
	draw_text(x + 1, y + 1, text);
	draw_text(x - 1, y + 1, text);
	draw_text(x + 1, y - 1, text);
	draw_text(x - 1, y - 1, text);
	
	//Text
	draw_set_color(textColor);
	draw_text(x, y, text);
	
	draw_set_color(c_white);
}