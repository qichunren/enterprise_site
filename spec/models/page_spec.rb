require 'spec_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url_slug) }
  it { should validate_presence_of(:body) }
  
  
end

# == Schema Information
#
# Table name: pages
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)     not null
#  keywords     :string(255)
#  description  :string(255)
#  body         :text
#  url_slug     :string(255)     not null
#  created_by   :string(255)
#  is_published :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#

