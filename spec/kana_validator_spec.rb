require 'spec_helper'

class HiraganaUser < TestModel
  validates :name, kana: {with: %i(hiragana)}
end

class KatakanaUser < TestModel
  validates :name, kana: {with: %i(katakana)}
end

class KatakanaZenkakuUser < TestModel
  validates :name, kana: {with: %i(katakana_zen)}
end

class KatakanaHankakuUser < TestModel
  validates :name, kana: {with: %i(katakana_han)}
end

describe KanaValidator do
  subject { klass.new(name: string).valid? }

  describe 'with: [:hiragana]' do

    let(:klass) { HiraganaUser }

    context 'given hira-gana string' do
      let(:string) { 'ひらがな' }

      it { should be_true }
    end

    context 'given zenkaku kata-kana string' do
      let(:string) { 'カタカナ' }

      it { should be_false }
    end

    context 'given hankaku kata-kana string' do
      let(:string) { 'ｶﾀｶﾅｰｶﾞﾀﾞｶﾞﾀﾞ' }

      it { should be_false }
    end

    context 'given zenkaku kata-kana and hira-gana string' do
      let(:string) { 'カタカナひらがな' }

      it { should be_false }
    end

    context 'given hira-gana and kata-kana string' do
      let(:string) { 'ひらがなカタカナ' }

      it { should be_false }
    end

    context 'given alphabet string' do
      let(:string) { 'abcdefg' }

      it { should be_false }
    end
  end

  describe 'with: [:katakana]' do

    let(:klass) { KatakanaUser }

    context 'given hira-gana string' do
      let(:string) { 'ひらがな' }

      it { should be_false }
    end

    context 'given zenkaku kata-kana string' do
      let(:string) { 'カタカナ' }

      it { should be_true }
    end

    context 'given hankaku kata-kana string' do
      let(:string) { 'ｶﾀｶﾅｰｶﾞﾀﾞｶﾞﾀﾞ' }

      it { should be_true }
    end

    context 'given zenkaku kata-kana and hira-gana string' do
      let(:string) { 'カタカナひらがな' }

      it { should be_false }
    end

    context 'given hira-gana and kata-kana string' do
      let(:string) { 'ひらがなカタカナ' }

      it { should be_false }
    end

    context 'given alphabet string' do
      let(:string) { 'abcdefg' }

      it { should be_false }
    end
  end

  describe 'with: [:katakana_zen]' do

    let(:klass) { KatakanaZenkakuUser }

    context 'given hira-gana string' do
      let(:string) { 'ひらがな' }

      it { should be_false }
    end

    context 'given zenkaku kata-kana string' do
      let(:string) { 'カタカナ' }

      it { should be_true }
    end

    context 'given hankaku kata-kana string' do
      let(:string) { 'ｶﾀｶﾅｰｶﾞﾀﾞｶﾞﾀﾞ' }

      it { should be_false }
    end

    context 'given zenkaku kata-kana and hira-gana string' do
      let(:string) { 'カタカナひらがな' }

      it { should be_false }
    end

    context 'given hira-gana and kata-kana string' do
      let(:string) { 'ひらがなカタカナ' }

      it { should be_false }
    end

    context 'given alphabet string' do
      let(:string) { 'abcdefg' }

      it { should be_false }
    end
  end

  describe 'with: [:katakana_han]' do

    let(:klass) { KatakanaHankakuUser }

    context 'given hira-gana string' do
      let(:string) { 'ひらがな' }

      it { should be_false }
    end

    context 'given zenkaku kata-kana string' do
      let(:string) { 'カタカナ' }

      it { should be_false }
    end

    context 'given hankaku kata-kana string' do
      let(:string) { 'ｶﾀｶﾅｰｶﾞﾀﾞｶﾞﾀﾞ' }

      it { should be_true }
    end

    context 'given zenkaku kata-kana and hira-gana string' do
      let(:string) { 'カタカナひらがな' }

      it { should be_false }
    end

    context 'given hira-gana and kata-kana string' do
      let(:string) { 'ひらがなカタカナ' }

      it { should be_false }
    end

    context 'given alphabet string' do
      let(:string) { 'abcdefg' }

      it { should be_false }
    end
  end

end
