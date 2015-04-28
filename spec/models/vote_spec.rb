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
  end
