/// @description Create upgrades

var centerX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
var centerY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
			
var upgrade1 = instance_create_layer(centerX - 128, centerY, "Main", objUpgrade);
var upgrade2 = instance_create_layer(centerX, centerY, "Main", objUpgrade);
var upgrade3 = instance_create_layer(centerX + 128, centerY, "Main", objUpgrade);

objAudioController.playSound(sndUpgradeMenu);

//Get upgrade indices
upgrade1.upgradeIndex = getRandomUpgrade();
upgrade1.upgradeTitle = getUpgradeName(upgrade1.upgradeIndex);
upgrade1.upgradeText = getUpgradeText(upgrade1.upgradeIndex);

do
{
	upgrade2.upgradeIndex = getRandomUpgrade();
} until (upgrade2.upgradeIndex != upgrade1.upgradeIndex)	

upgrade2.upgradeTitle = getUpgradeName(upgrade2.upgradeIndex);
upgrade2.upgradeText = getUpgradeText(upgrade2.upgradeIndex);

do
{
	upgrade3.upgradeIndex = getRandomUpgrade();
} until (upgrade3.upgradeIndex != upgrade1.upgradeIndex && upgrade3.upgradeIndex != upgrade2.upgradeIndex)	

upgrade3.upgradeTitle = getUpgradeName(upgrade3.upgradeIndex);
upgrade3.upgradeText = getUpgradeText(upgrade3.upgradeIndex);