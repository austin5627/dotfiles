import subprocess


def edit_configs(qtile):
    configs = [
        "~/.config/qtile",
        "~/.config/alacritty",
        "~/.config/fish",
        "~/.config/nvim",
        "/etc/logid.cfg",
        "~/.config/rofi",
        "~/.mozilla/firefox/dwj268q6.default-release/chrome/userChrome.css",
    ]
    config_str = "\\n".join(configs)
    choice = subprocess.getoutput(
        f'echo -e "{config_str}" | .config/rofi/launchers/colorful/launcher.sh -dmenu -i -p "Edit Configs"'
    )
    if choice:
        qtile.cmd_spawn(f"alacritty -e nvim {choice}", shell=True)
