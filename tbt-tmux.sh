set -ex
HERE=$(dirname $(realpath $BASH_SOURCE))
cd $HERE

tmux rename-window spawn

tmux new-window -n main -c $HERE/time-block-tracker
tmux send "npm run watch" Enter

tmux split-window -h -c $HERE/time-block-tracker-server-v2/bin
tmux send "bash run-server.sh" Enter

tmux new-window -n webserve -c $HERE/time-block-tracker
tmux send "bash run-server.sh" Enter

tmux select-window -t main