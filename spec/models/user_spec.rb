require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Anything",
                        last_name: "Lorem ipsum",
                        email: 'my@mail.com',
                        age: 40)
  }


  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "email should be present" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "age should be integer" do
    subject.age = 'test'
    expect(subject).to_not be_valid
  end

  it "age should be integer" do
    subject.age = 60
    expect(subject).to be_valid
  end

  it "age must be greater than 18" do
    user = User.create!(first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 23)
    user = User.create!(first_name: 'first', last_name: 'user', email: 'good@mail.com', age: 15)
    expect(User.age_must_be_18.size).to eq(1)
  end

  it "age must be greater than 18" do
    user = User.create!(first_name: 'first', last_name: 'user', email: 'first@mail.com', age: 23)
    expect(User.latest_users.size).to eq(1)
  end


end
