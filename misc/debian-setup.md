### what i've done so far
- installed neovim (see nvim folder)
#### changed system settings
>   increased animation speen<br>
>   got rid of edge light bars when approacing windows<br>
>   added 4 default desktops instead of 1<br>
>   autohide bottom bar<br>
- switched up wallpaper/ lock screen
- installed curl
- found out it doesn't like `reboot` command (i'll map `/sbin/reboot` later)
#### konsole changes
>  dark pastels<br>
>  25% transparency<br>
>  scrollbar hidden<br>
>  hid options/task bar<br>
- global theme > colors > pink
- sun splash screen
- breeze black pure theme for windows
- accessibility - disabled bell and screen reader
- config display settings - night color - sunrise and sunset
#### video wallpaper
> tried wallset<br>
> installed with --force bc it wasn't detecting dependencies<br>
> errors out the a$$<br>
> used the smart wallpaper plugin instead
- polybar config
- sddm - uzuri-sddm
#### panel
> floating <br>
> 34 height <br>
> autohide <br>
> large spacing, don't fill free space <br>
> autohide all small icons <br>
> remove everything other than app launcher and hidden icons, decrease width, right alignment<br>
#### icon pack
- no icons on desktop or dock so this is exclusively for files/ app menus
> adiwaita icons<br>
> other themes: <br>
> [flight-light-icons](https://www.xfce-look.org/p/2068651) [buuf for many desktops](https://www.xfce-look.org/p/1012233) [guitar icons](https://www.xfce-look.org/p/1012396) [soft orange revised](https://www.xfce-look.org/p/1267404)
> installing an icon pack from terminal
> cd /usr/share/icons/
> sudo git clone https://git.disroot.org/eudaimon/buuf-nestort.git
> should appear in icon menu in settings
#### extra
- added rofi, profanity, dino, etc, etc
#### kwin (not using)
- mv kdeglobals > kdeglobals.old
- add frame and inactiveFrame borders
- removing titlebar vvv
- windows rules > new > regex > .* >  add property > appearance + fixes > no titlebar and frame > force > yes
#### bismuth (using)
```shell
echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list > /dev/null
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install kwin-bismuth
```
- all gaps 4px
- get rid of overlap vvv
- win rules > new > unimportant > normal windows > add prop > min size > force 0x0
- fix dolphin sizing
- win rules > new > exact match > dolphin > noraml windows > add prop > ignore geom > force > yes


