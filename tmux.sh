#!/bin/sh

# Install Tmux plugin manager
## Check if package git is installed
REQUIRED_PKG="git"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
#echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
	echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
	sudo apt-get --yes install $REQUIRED_PKG 
fi
## Check if tmux plugin manager is installed (folder tpm exists?)
FILE=~/.tmux/plugins/tpm
if [ ! -d "$FILE" ]; then
	echo "No tmux plugin manager. Setting up tmux plugin manager."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

tmux source-file ~/.tmux.conf


# Setup session
tmux source-file ~/.tmux.conf
if ( tmux has-session -t "main" ); then
	tmux attach -t main
else 
	# create a new session. Note the -d flag, we do not want to attach just yet!
	tmux new-session -s main -n 'main_window' -d

	# send 'tail -f foo<enter>' to the first pane.
	# I address the first pane using the -t flag. This is not necessary,
	# I'm doing it so explicitly to show you how to do it.
	# for the <enter> key, we can use either C-m (linefeed) or C-j (newline)
	#tmux send-keys -t main:main_window.0 'htop' C-j


	# split the window *horizontally*
	tmux split-window -h



	# we now have two panes in myWindow: pane 0 is above pane 1
	# again, specifying pane 1 with '-t 1' is optional
	tmux send-keys -t 1 'htop' C-j

	#Split vertically
	tmux split-window -v

	# uncomment the following command if you want to attach
	# explicitly to the window we just created

	tmux select-window -t main:main_window


	# finally attach to the session
	tmux attach -t main

fi
