# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
end
