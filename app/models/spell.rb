class Spell < ApplicationRecord
  def self.all_for_display (params)
    results = []
    if params[:name].present? && params[:description].present?
      results = Spell.where("name LIKE ? AND description LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    elsif params[:name].present?
      results = Spell.where("name LIKE ? ", "%#{params[:name]}%")
    elsif params[:description].present?
      results = Spell.where("description LIKE ? ", "%#{params[:description]}%")
    elsif params[:klass].present?
      results = Spell.where("klass LIKE ? ", "%#{params[:klass]}%")
    else
      results = Spell.all.order(:name)
    end
    results.each_slice(6).to_a
  end
end
