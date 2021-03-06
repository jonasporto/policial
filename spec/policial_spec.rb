# frozen_string_literal: true

require 'spec_helper'

describe Policial do
  describe '.style_guides' do
    before(:all) { @style_guides_initial_value = Policial.style_guides.dup }
    after { Policial.style_guides = @style_guides_initial_value.dup }

    it 'defaults to DEFAULT_STYLE_GUIDES' do
      expect(Policial.style_guides).to eq(Policial::DEFAULT_STYLE_GUIDES)
    end

    it 'can be overwritten' do
      custom = [Policial::StyleGuides::Scss, Policial::StyleGuides::Ruby]
      Policial.style_guides = custom

      expect(Policial.style_guides).to eq(custom)
    end

    it 'can be appended' do
      Policial.style_guides << Policial::StyleGuides::Scss
      expect(Policial.style_guides).to include(Policial::StyleGuides::Scss)
    end
  end
end
