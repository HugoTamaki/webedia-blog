require 'rails_helper'

describe Post do
  let(:post) { FactoryGirl.build(:post) }

  describe 'validations' do
    context 'is valid' do
      it 'when all attributes are filled' do
        expect(post.save).to be(true)
      end
    end

    context 'is invalid' do
      before do
        post.title = nil
        post.subtitle = nil
        post.content = nil
      end

      it 'when required attributes are empty' do
        expect(post.save).to be(false)
      end
    end
  end
end
