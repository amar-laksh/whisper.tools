if [ "$(systemctl --user is-active whisper-cpp-dictate.service)" == "active" ]; then systemctl --user stop whisper-cpp-dictate.service ; else systemctl --user restart whisper-cpp-dictate.service  ;fi
