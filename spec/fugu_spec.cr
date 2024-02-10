require "./spec_helper"

describe Fugu do

  it "renders /" do
    json_body = {"version": Fugu::VERSION}
    get "/"
    response.body.should eq(json_body.to_json)
  end

  it "renders /up" do
    json_body = {"status": "OK"}
    get "/up"
    response.body.should eq(json_body.to_json)
  end

end
