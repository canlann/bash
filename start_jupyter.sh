
#!/bin/sh

wlan=$(ip route get 1 | awk '{print $7;exit}')
echo Switching to Address: $wlan

linenumber=$(awk '/c.NotebookApp.ip =/{print NR; exit }' /home/marius/.jupyter/jupyter_notebook_config.py)

sed -i "$linenumber s/.*/c.NotebookApp.ip = '$wlan'/g" /home/marius/.jupyter/jupyter_notebook_config.py

jupyter lab
