# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  domicile   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
end
