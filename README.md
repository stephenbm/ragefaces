# Ragefaces

A simple gem that adds markup to text to display rage faces. It adds a span with the classes rageface and the name of the icon. 

Feel free to send a pull request with any improvements

## Installation

Add this line to your application's Gemfile:

    gem 'ragefaces'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ragefaces

## Usage

This method should only accept plain text, do not pass it html as it could break links and escape characters e.g. &amp;don't do this - it would break the escape sequence. If you to use it with html or anchors rather remove them first and add them back in. This is sufficient for my use:
```
ragefaces: (text) ->
    cache_anchors = text.match(/<a [^<]+<\/a>/g) or []
    for anchor in cache_anchors
      text = text.replace(anchor, '<a>')
    cache_escapes = text.match(/\&(#[0-9]+)|[a-zA-Z]+;/g) or []
    for escape in cache_escapes
      text = text.replace(escape, '<e>')
    text = ragefaces.markup(text)
    for escape in cache_escapes
      text = text.replace('<e>', escape)
    for anchor in cache_anchors
      text = text.replace('<a>', anchor)
    return text
}
```
If you are just marking up plain text then all you need is:
```
ragefaces.markup(text)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
