# Patch My PC Prescript Notification

 Script to notify a user to close an application during an update.

 ![Demonstration Gif](https://raw.githubusercontent.com/asjimene/Patch-My-PC-Prescript-Notification/master/Images/WorkingNotificationScript.gif)

## Quick Instructions

1. Download the 2 scripts in this repository to the device running Patch My PC
2. Set the "$PrescriptTimeout" for the amount of time you want the notification to be available for the user. (Note that Updates have a 10 minute runtime by default and the prescript runtime is included in that runtime)
3. Run the "CreateNotificationScripts.ps1", this will create a powershell script for each update available in Patch My PC in a new folder
4. Copy the desired scripts to a central location where the Patch My PC publisher can access them.
5. In Patch My PC right click the desired product and choose either "Skip installation when the application is in use" or "Auto close application processes before installation", note that this will be the behavior of the update when a user ignores the notification toast or hits the "Ignore" button.
 ![RightClick Option Image](https://raw.githubusercontent.com/asjimene/Patch-My-PC-Prescript-Notification/master/Images/RightClickOption.png)
6. Right click the desired product and choose "Add custom pre/post update installation scripts"
7. Check the box for "Run the pre-update script before performing any auto-close or skip process checks"
8. Click "Browse" for the "Pre-Update Script", and navigate to the appropriate script that was generated for this app.
 ![Prescript Page Image](https://raw.githubusercontent.com/asjimene/Patch-My-PC-Prescript-Notification/master/Images/PrescriptPage.png)
9. Repeat steps 4 through 8 for all desired products


## Special Thanks

* @SysBehr https://twitter.com/SysBehr
* Trevor Jones https://smsagent.blog/2018/06/15/using-windows-10-toast-notifications-with-configmgr-application-deployments/
* Roger Zander https://reg2ps.azurewebsites.net/