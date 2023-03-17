require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿' do
    context '投稿できる場合' do
      it 'textとimageが存在すれば投稿できる' do
        expect(@post).to be_valid
      end
      it 'textが空でも投稿できる' do
        @post.text = ''
        expect(@post).to be_valid
      end
      it 'imageが空でも投稿できる' do
        @post.image = nil
        expect(@post).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'textとimageが空では投稿できない' do
        @post.text = ''
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐づいていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
