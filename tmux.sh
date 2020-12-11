#!/bin/sh

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
