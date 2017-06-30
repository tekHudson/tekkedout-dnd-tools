class Spell < ApplicationRecord
  def self.all_for_display(klass = nil, name = nil, description = nil)
    return where(klass: klass, name: name, description: description).order(:name).each_slice(6).to_a if klass && name && description
    return where(klass: klass, description: description).order(:name).each_slice(6).to_a if klass && description
    return where(name: name, description: description).order(:name).each_slice(6).to_a if name && description
    return where(klass: klass, name: name).order(:name).each_slice(6).to_a if klass && name
    return where(description: description).order(:name).each_slice(6).to_a if description
    return where(klass: klass).order(:name).each_slice(6).to_a if klass
    return where(name: name).order(:name).each_slice(6).to_a if name
    all.order(:name).each_slice(6).to_a
  end
end
