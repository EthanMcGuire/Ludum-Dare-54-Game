/// @description Get selected

if (instance_exists(objPauseMenu) || alarm[0] != -1)
{
	return;	
}

//Destroy the upgrade
if (destroy)
{	
	width = max(width - 7, 12);	
	height = max(height - 12, 12);	
	
	if (width == 12 && height == 12)
	{
		instance_destroy();	
	}
	
	return;
}

//Expand the upgrade
if (expand)
{	
	width = min(width + 7, maxWidth);	
	height = min(height + 12, maxHeight);	
	
	if (width == maxWidth && height == maxHeight)
	{
		expand = false;
	}
	
	return;
}

var buttonX, buttonY, buttonW, buttonH;

buttonX = x;
buttonY = y + height / 2 - 24;
buttonW = sprite_get_width(sprUpgradeButton);
buttonH = sprite_get_height(sprUpgradeButton);

//Get selected
if (collision_rectangle(buttonX - buttonW / 2, buttonY - buttonH / 2, buttonX + buttonW / 2, buttonY + buttonH / 2, objMouse, false, true))
{
	selected = true;	
}
else
{
	selected = false;
}

if (selected && mouse_check_button_pressed(mb_left))
{
	objAudioController.playSound(sndUpgrade);
	
	//Add upgrade
	addUpgrade(upgradeIndex);
	
	//Destroy upgrade menu
	with (objUpgrade)
	{
		destroy = true;
	}
}