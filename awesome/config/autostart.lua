local awful = require('awful')

awful.spawn.with_shell('~/.fehbg')
awful.spawn.with_shell('killall -q picom; while pgrep -u $UID -x picom >/dev/null; do sleep 1; done; picom --experimental-backends')
awful.spawn.with_shell('rivalcfg -s 500 -S 1000 -e breath -c "#22820c"')
