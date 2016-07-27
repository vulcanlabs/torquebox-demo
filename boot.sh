#! /bin/bash
trap 'jobs -p | xargs kill' EXIT

pushd batch-app
# bundle install
torquebox run &
popd

pushd main-app
# bundle install
# rake db:setup
rails server &
popd

wait
