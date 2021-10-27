# StickTrick
----------------------------------------------------------------------------------------------------------------
**This project has been abandoned because Clone Hero drum support rendered StickTrick an obsolete novelty**
----------------------------------------------------------------------------------------------------------------

This is a decently playable drum (4-lane + kick) environment for Etterna. If you're already familiar with Etterna, the setup should be simple enough. Since this is in a very early stage and I've had minimal external testing, expect some things to be odd

Rock Band drums environment for Etterna. **So far only pump it up mode is fully supported (4 heads and kick)**

The plan is to support regular Rock Band, Rock Band Pro, and Guitar Hero modes by utilising pump, doubles, and solo Stepmania files. Of course the three modes will have noteskin variances tailored to each one. Pro mode will include hats, GH will look like GH. You get the point.

Preferably the scoring systems from either of the two games would be supported but I'm not sure if that is even possible through theme changes alone.


# HOW TO PLAY

**MAKE SURE YOU ARE USING ETTERNA VERSION .66.1** BECAUSE THERE IS NO GUARANTEE IT WILL WORK ON ANY OTHER VERSIONS. YOU CAN DOWNLOAD VERSION .66.1 HERE IF YOU DON'T HAVE IT<br/>
64-bit: https://github.com/etternagame/etterna/releases/download/v0.66.1/Etterna-0.66.1-x64.exe<br/>
32-bit: https://github.com/etternagame/etterna/releases/download/v0.66.1/Etterna-0.66.1-i386.exe<br/>

Download songs from the link provided in **songs.txt**

Put the StickTrick theme in the theme folder ( `Etterna\Themes` )

Put the noteskin(s) in the pump noteskins folder ( `Etterna\Noteskins\pump` )

Make sure to **select PUMP gamemode** (Main menu -> options -> select game -> pump)

**Set key binds** for your controller (Main menu -> options -> config key/joy mappings)

Make sure to **use the provided theme** (Main menu -> options -> display options -> appearance options). It looks very much like the Etterna default theme on the surface, but there are internal changes which tune the theme specifically for playing drums instead of keyboard

The provided noteskin(s) force an aggressive hallway perspective, meaning that scroll speed will feel vastly slower than normal. You can approximately **use 2.5x your normal cmod** to achieve the same perceived speed (e.g. c800 -> c2000). This has not been double checked with math or anything, it's simply a rough approximation

Not required, but anti aliasing can be forced on via your graphics card's driver software. The game has no anti aliasing on the 3d objects in gameplay, so forcing it on can spare your eyes just a bit
