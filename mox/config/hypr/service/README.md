# README - User systemd services

1. Link .service and .timer to /etc/systemd/user/
2. Reload systemd daemon with ```sudo systemctl daemon-reload```
3. Start .service as user ```systemctl --user start whatever.service```
4. Enable .timer as user ```systemctl --user enable whatever.timer```
5. Start .timer as user ```systemctl --user start whatever.timer```
6. Check status and verify, that timer executes at scheduled time ```systemctl --user status whatever.timer```
