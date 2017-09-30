require 'rails_helper'

RSpec.describe CapybaraBox::Base, '.add_preference' do
  subject { described_class.new parameters }

  context 'when is chrome' do
    let!(:parameters) { { browser: :chrome } }

    it 'adds the argument' do
      subject.add_preference :key, :value

      expect(subject.options.prefs).to eq(key: :value)
    end
  end

  context 'when is chrome headless' do
    let!(:parameters) { { browser: :chrome_headless } }

    it 'adds the argument' do
      subject.add_preference :key, :value

      expect(subject.options.prefs).to eq(key: :value)
    end
  end

  context 'when is firefox' do
    let!(:parameters) { { browser: :firefox } }

    it 'does not applies options' do
      subject.add_preference :key, :value

      expect(subject.options).to be_nil
    end
  end
end
