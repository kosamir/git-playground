### help za konfiguraciju graficke kartice na monitorima
`xrandr -q` - ovo vraca sve spojene monitora na graficku karticu

### primjer
`xrandr -q`  

`
- Screen 0: minimum 8 x 8, current 7680 x 4320, maximum 32767 x 32767  
- **DP-1.2 connected 3840x2160+3840+0 (normal left inverted right x axis y axis) 600mm x 340mm**  
   3840x2160     30.00*+  29.97    25.00    23.98    
   2560x1440     59.95    
   1920x1080     60.00    59.94    50.00    29.97    23.98    
   1600x900      60.00    
   1280x1024     60.02    
   1280x800      59.81    
   1280x720      60.00    59.94    
   1152x864      60.00    
   1024x768      60.00    
   800x600       60.32    
   720x576       50.00    
   720x480       59.94    
   640x480       59.94    59.93  
- **DP-0 disconnected (normal left inverted right x axis y axis)**
- **DP-1 disconnected (normal left inverted right x axis y axis)** 
- **HDMI-0 connected 3840x2160+0+0 (normal left inverted right x axis y axis) 597mm x 336mm**
   2560x1440     59.95*+  
   2048x1080     60.00    
   1920x1200     59.88    
   1920x1080     60.00    59.94    50.00    60.05    60.00    50.04    
   1680x1050     59.95    
   1600x1200     60.00    
   1280x1024     75.02    60.02    
   1280x800      59.81    
   1280x720      59.94    50.00    
   1152x864      75.00    
   1024x768      75.03    60.00    
   800x600       75.00    60.32    
   720x576       50.00    
   720x480       59.94    
   640x480       75.00    59.94    59.93    
- **eDP-1-1 connected primary 3840x2160+1900+2160 (normal left inverted right x axis y axis) 344mm x 193mm**
   3840x2160     60.00*+  59.98    59.97    
   3200x1800     59.96    59.94    
   2880x1620     59.96    59.97    
   2560x1600     59.99    59.97    
   2560x1440     59.99    59.99    59.96    59.95    
   2048x1536     60.00    
   1920x1440     60.00    
   1856x1392     60.01    
   1792x1344     60.01    
   2048x1152     59.99    59.98    59.90    59.91    
   1920x1200     59.88    59.95    
   1920x1080     60.01    59.97    59.96    59.93    
   1600x1200     60.00    
   1680x1050     59.95    59.88    
   1600x1024     60.17    
   1400x1050     59.98    
   1600x900      59.99    59.94    59.95    59.82    
   1280x1024     60.02    
   1440x900      59.89    
   1400x900      59.96    59.88    
   1280x960      60.00    
   1440x810      60.00    59.97    
   1368x768      59.88    59.85    
   1360x768      59.80    59.96    
   1280x800      59.99    59.97    59.81    59.91    
   1152x864      60.00    
   1280x720      60.00    59.99    59.86    59.74    
   1024x768      60.04    60.00    
   960x720       60.00    
   928x696       60.05    
   896x672       60.01    
   1024x576      59.95    59.96    59.90    59.82    
   960x600       59.93    60.00    
   960x540       59.96    59.99    59.63    59.82    
   800x600       60.00    60.32    56.25    
   840x525       60.01    59.88    
   864x486       59.92    59.57    
   800x512       60.17    
   700x525       59.98    
   800x450       59.95    59.82    
   640x512       60.02    
   720x450       59.89    
   700x450       59.96    59.88    
   640x480       60.00    59.94    
   720x405       59.51    58.99    
   684x384       59.88    59.85    
   680x384       59.80    59.96    
   640x400       59.88    59.98    
   576x432       60.06    
   640x360       59.86    59.83    59.84    59.32    
   512x384       60.00    
   512x288       60.00    59.92    
   480x270       59.63    59.82    
   400x300       60.32    56.34    
   432x243       59.92    59.57    
   320x240       60.05    
   360x202       59.51    59.13    
   320x180       59.84    59.32    
  2560x1440 (0x1c2) 241.500MHz +HSync -VSync  
        h: width  2560 start 2608 end 2640 total 2720 skew    0 clock  88.79KHz  
        v: height 1440 start 1443 end 1448 total 1481           clock  59.95Hz  
  1920x1200 (0x1d8) 193.250MHz -HSync +VSync  
        h: width  1920 start 2056 end 2256 total 2592 skew    0 clock  74.56KHz  
        v: height 1200 start 1203 end 1209 total 1245           clock  59.88Hz  
  1600x1200 (0x1dd) 162.000MHz +HSync +VSync  
        h: width  1600 start 1664 end 1856 total 2160 skew    0 clock  75.00KHz  
        v: height 1200 start 1201 end 1204 total 1250           clock  60.00Hz  
  1680x1050 (0x1dc) 146.250MHz -HSync +VSync  
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz  
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz  
  1280x1024 (0x1c9) 108.000MHz +HSync +VSync  
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz  
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz  
  1280x800 (0x1ca) 83.500MHz -HSync +VSync  
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz  
        v: height  800 start  803 end  809 total  831           clock  59.81Hz  
  1152x864 (0x1cd) 81.620MHz -HSync +VSync  
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz  
        v: height  864 start  865 end  868 total  895           clock  60.00Hz  
  1024x768 (0x1ce) 65.000MHz -HSync -VSync  
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz  
        v: height  768 start  771 end  777 total  806           clock  60.00Hz  
  800x600 (0x1cf) 40.000MHz +HSync +VSync  
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz  
        v: height  600 start  601 end  605 total  628           clock  60.32Hz  
  640x480 (0x1d2) 25.175MHz -HSync -VSync  
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz  
        v: height  480 start  490 end  492 total  525           clock  59.94Hz  
`

### setup mode primjer  
- DELL monitor  
`xrandr --output HDMI-0 --mode 3840x2160 --pos 0x0`    
- primarni laptop monitor  
`xrandr --output eDP-1-1 --mode 3840x2160 --pos 1900x2160`   
    - setiraj primarni monitor na eDp-1-1 postavi rezoluciu na 3840x2160 i pozicioniraj ga na   
    - x=1900 y=2160  
- LG monitor
`xrandr --output DP-1.2 --mode 3840x2160 --pos 3840x0`  

