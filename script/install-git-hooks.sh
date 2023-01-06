#!/bin/bash

ln -s -f ../../script/git-hooks/pre-push.sh ./.git/hooks/pre-push
ln -s -f ../../script/git-hooks/pre-receive.sh ./.git/hooks/pre-receive

chmod +x ./script/git-hooks/pre-push.sh
chmod +x ./script/git-hooks/pre-receive.sh
