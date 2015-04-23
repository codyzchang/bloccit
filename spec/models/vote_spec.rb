require 'rails_helper'

describe Vote do

  before do
    let(:upvote) {Vote.new value:1}
    let(:downvote) {Vote.new value:-1}
  end

   describe "value validation" do       
      it "+1 value" do
        expect(upvote.valid?).to eq(true)
      end

      it "-1 value" do
        expect(downvote.valid?).to eq(true)          
      end
    end
   
   describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
  end
