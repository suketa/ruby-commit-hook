#!/bin/bash -eu
set -o pipefail
# This script is executed by `git@git.ruby-lang.org:ruby.pre.git/hooks/pre-receive`.
# The ruby.pre repository is just a sandbox, and any commit isn't pushed to it automatically.

# script parameters
ruby_git="/var/git/ruby.git"
hook_log="/tmp/pre-receive-pre.log"
ruby_commit_hook="$(cd "$(dirname $0)"; cd ..; pwd)"

$ruby_commit_hook/bin/prohibit-merge-commits.rb $* || exit 1

$ruby_commit_hook/bin/check-email.rb $* || exit 1
