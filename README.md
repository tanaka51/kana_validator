# KanaValidator

Rails 3+ validator for ひらがな and かたかな.

## Installation

Add this line to your application's Gemfile:

    gem 'kana_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kana_validator

## Usage

```ruby
class HiraganaUser < ActiveRecord::Base
  validates :name, kana: {with: %i(hiragana)}
end
```

options are:
- `:hiragana` accepts ひらがな.
- `:katakana` accepts カタカナｶﾀｶﾅ.
- `:katakana_zen` accepts カタカナ.
- `:katakana_han` accepts ｶﾀｶﾅ.


## Contributing

1. Fork it ( http://github.com/tanaka51-jp/kana_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
