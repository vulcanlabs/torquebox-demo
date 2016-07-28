# How to get a pry console in torquebox

-------------------

## For torquebox-4.x

You can just start the app using `torquebox run` or `rails s`
and use `binding.pry` as normal.

## For torquebox-3, or pry-remote

### pry-remote

[pry-remote](https://github.com/Mon-Ouie/pry-remote)

Put this in Gemfile and then `bundle install`

    gem 'pry-remote'

On the relevant line, where you would normally put `binding.pry`, say

    binding.remote_pry

or optionally if you need to listen on a non-standard interface and port

    binding.remote_pry '10.20.1.170', 9910

Run the thing you want to debug. Then say in a shell

    $ pry-remote -w

And it will connect as soon as the `binding.remote_pry` executes, or immediately
if `binding.remote_pry` has already executed.

Just for reference here are some [older issues](https://github.com/Mon-Ouie/pry-remote/issues/58),
but it works well as of this writing - 21-Jul-2016


### torquebox-console

[A Pry console for TorqueBox.](https://github.com/torquebox/torquebox-console)
is a gem that says it allows access to all apps hosted in a
torquebox, but when I try it can't connect.

Looking at the torquebox logs, it seems to start up in torquebox OK, but running
`tbconsole` from a shell raise a cannot connect error.
