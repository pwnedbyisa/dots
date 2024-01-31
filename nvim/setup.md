### installation
```
sudo apt install neovim
```
then download latest appimage so there are no issues with packages not running on older versions
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
```
then move the appimage to the nvim location so the nvim keybinding works correctly
```
sudo mv nvim.appimage /usr/local/bin/nvim
```
___
### customization
create config file
```
mkdir ~/.config/nvim
```


