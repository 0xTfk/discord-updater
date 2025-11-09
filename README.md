#  Discord Updater  

A small script to install Discord on Linux every time its ask for update, instead of downloading it manually every time, I wrote a script that does it automatically.  
---



⚠️ Disclaimer

I created this script for personal use on my own machines.
It works fine for me, but if you decide to use it, you do so at your own risk.
Always review scripts before running them with sudo.

---

## What It Does  

- Detects your package manager automatically  
- Downloads the latest Discord version  
- Installs or updates Discord  
- Fixes missing dependencies if needed  
- Cleans up temporary files

---

## ⚙️ How to Use  

### 1. Run from the repository  

##### Clone the repo  
```bash
git clone https://github.com/0xTfk/discord-updater.git
cd discord-updater
```

##### Bash version
```bash
chmod +x update-discord.sh
./update-discord.sh
```

#### Zsh version
```bash
chmod +x update-discord.zsh
./update-discord.zsh
```

### 2. Make it easy to run

You can copy the script to your home folder so you can run it when you open the terminal :

```bash
# bash 
cp update-discord.sh ~/fixdiscord
chmod +x ~/fixdiscord

# Zsh
cp update-discord.zsh ~/fixdiscord
chmod +x ~/fixdiscord
```
you can also create an alias to run it with a short command:

```bash
# for bash
echo "alias fixdiscord='~/fixdiscord'" >> ~/.bashrc
source ~/.bashrc
# or for Zsh
echo "alias fixdiscord='~/fixdiscord'" >> ~/.zshrc
source ~/.zshrc
```

