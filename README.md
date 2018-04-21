# DBL-Ruby

A ruby library for Discord Bot list.

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

## But ruby sucks

no u
