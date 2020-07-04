# MCrack
Minecraft Bedrock License Bypasser

# How Its Works?
Basicly, its going to replace original MainActivity that defined on "AndroidManifest.xml" so it wont linked further into another smali's and instead of doing another process from another smali's, its also patching certain. The fake MainActivity wont interrupt any Connection unlike [Revision](https://github.com/Yuuki-kito/Revision) that blocking random online license check address (Maybe it'll work if using IPTables drop hex but since i cant find any sources for IPTables to work on Windows)

# How To Use?
You'll grab some apk modifier such as [APK Easy Tool For Windows](https://forum.xda-developers.com/android/software-hacking/tool-apk-easy-tool-v1-02-windows-gui-t3333960) or [APK Editor For Android](https://rexdl.com/android/apk-editor-pro-apk.html/).
1. Now Put the "PmsHookApplication.smali" into "com/mojang/minecraftpe" inside the Smali Folder (On APK Editor For Android, make sure to check Dex To Smali Converter)
2. After moving the Hook, now look up for AndroidManifest.xml and find :
```
    <application android:icon="@drawable/icon" android:label="@string/app_name">
```
Now add new AndroidName and path into PmsHookApplication.smali, so it'll look like this :
```
    <application android:icon="@drawable/icon" android:label="@string/app_name" android:name="com.mojang.minecraftpe.PmsHookApplication">
```
3. After doing all the steps, now rebuild/recompile the apk's (On APK Easy Tool For Windows, you need to zipalign the apk's after doing signing).

# What The Uses Of Other Redundant Files?
Well, its just mine GUI for Minecraft Bedrock, so it'll show some WaterMark and Custom Background of MCrack. I think, Im not gonna explain how to install those since its not necessary....

# Congratulation!
You've done all the steps! Now go to Install your edited Minecraft Pocket Edition and start rickrolling on Minecraft Bedrock Server for FREE!!

