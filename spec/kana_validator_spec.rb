require 'spec_helper'

class HiraganaUser < TestModel
  validates :name, kana: {with: %i(hiragana)}
end

describe KanaValidator do
  describe 'validation' do
    subject { klass.new(name: term).valid? }

    context 'when option are {with: [:hira_han]}' do
      let(:klass) { HiraganaUser }

      context 'given ひらがな' do
        let(:term) { 'ひらがな' }

        it { should be_true }
      end
    end

  end
end
