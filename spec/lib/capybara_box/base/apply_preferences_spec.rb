require 'rails_helper'

RSpec.describe CapybaraBox::Base, '.apply_preferences' do
  subject { described_class.new parameters }

  before do
    allow(subject).to receive(:preferences) { { key: :value } }
  end

  context 'when is chrome' do
    let!(:parameters) { { browser: :chrome } }

    it 'applies' do
      expect(subject.options.prefs).to eq({})

      subject.apply_preferences

      expect(subject.options.prefs).to eq(key: :value)
    end
  end

  context 'when is chrome headless' do
    let!(:parameters) { { browser: :chrome_headless } }

    it 'applies' do
      expect(subject.options.prefs).to eq({})

      subject.apply_preferences

      expect(subject.options.prefs).to eq(key: :value)
    end
  end

  context 'when is firefox' do
    let!(:parameters) { { browser: :firefox } }

    it 'does not applies options' do
      subject.apply_preferences

      expect(subject.options).to be_nil
    end
  end
end
