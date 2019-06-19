# DBL-Ruby

A ruby library for Discord Bot list.

[![Gem](https://img.shields.io/gem/v/dblruby.svg)](https://rubygems.org/gems/dblruby)
[![Gem](https://img.shields.io/gem/dt/dblruby.svg)](https://rubygems.org/gems/dblruby)
[![Build Status](https://travis-ci.org/Chew/DBLRuby.svg?branch=master)](https://travis-ci.org/Chew/DBLRuby)
[![Discord Server](https://img.shields.io/discord/134445052805120001.svg?colorB=7289DA&logo=discord)](https://discord.gg/FznS7Ha)

## What is this for?

I mean, why not.

## Usage

Put this near the top of your ruby bot:

```ruby
require 'dblruby'

DBL = DBLRuby.new(api_key, bot_id)
```

Now, when you need to run a method, run DBL.method.

Example for getting server count.

```ruby
bot.command(:servercount) do |event|
  event.respond "I am on #{DBL.stats.getservercount} servers!"
end
```

Assuming the server count is 100, the output after running `servercount` would be:

"I am on 100 servers!"

## Documentation

Stuck? Know Ruby? Check out the [documentation](https://rubydocs.chew.pro/docs/dblruby).

## But ruby sucks

***NO U***
