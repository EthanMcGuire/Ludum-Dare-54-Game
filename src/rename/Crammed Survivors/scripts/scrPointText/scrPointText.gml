/// @function getPointText(points)
/// @param {Real} points Points to get text for
/// @return {String} Returns a point string with at least 5 digits.
function getPointText(points)
{
	var pointString = string(points);

	//Add zeroes
	for (var i = string_length(pointString); i < 5; i++)
	{
		pointString = "0" + pointString;	
	}
	
	return pointString;
}