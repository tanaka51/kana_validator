require 'moji'

unless defined?(Moji::NONE)
  # make null flag
  Moji.make_flag_set([], :NONE)
  # join existed set...
  Moji::NONE.instance_variable_set("@flag_set", Moji::KATA.instance_variable_get("@flag_set"))
end

class KanaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    type = Moji::NONE

    type |= Moji::HIRA                       if options[:with].include?(:hiragana)
    # DISCUSS: we should include Moji::JSYNBOL?
    type |= (Moji::KATA | Moji::JSYMBOL)     if options[:with].include?(:katakana)
    type |= Moji::ZEN_KATA                   if options[:with].include?(:katakana_zen)
    type |= (Moji::HAN_KATA | Moji::JSYMBOL) if options[:with].include?(:katakana_han)

    raise "Invalid option" if type == Moji::NONE

    unless value.is_a?(String) && value.chars.all?{|c| Moji.type?(c, type) }
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
