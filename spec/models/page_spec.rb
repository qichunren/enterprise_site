require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url_slug) }
  it { should validate_presence_of(:body) }
  
  
end
