require 'rails_helper'

describe User do
  let(:params) { { email: 'ax@a.pl', username: 'Axl', password: 'pass123'} }
  subject { described_class.new(username: 'abc', email: '123@a.pl', password: 'abc123') }

  context 'is valid' do
    it 'with valid params' do
      expect(subject).to be_valid
    end
  end
  context 'is invalid' do
    %w[password username email].each do |attribute|
      it "without #{attribute}" do
        subject.public_send(attribute + '=', nil)
        expect(subject).not_to be_valid
      end
    end

    it 'is invalid with password shorter than 6 characters' do
      subject.password = '1234'
      expect(subject).not_to be_valid
    end
    it 'is invalid with password longer than 20 characters' do
      subject.password =  'u'*21
      expect(subject).not_to be_valid
    end
  end
end
