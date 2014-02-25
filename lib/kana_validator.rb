require 'moji'

class KanaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.is_a?(String) && value.chars.all?{|c| Moji.type?(c, Moji::KANA) }
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
