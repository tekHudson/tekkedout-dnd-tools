class Spell < ApplicationRecord
  def self.all_for_display (params)
    results = []
    if params[:name].present? && params[:description].present?
      results = Spell.where("name LIKE ? AND description LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%").order(:name)
    elsif params[:name].present?
      results = Spell.where("name LIKE ? ", "%#{params[:name]}%").order(:name)
    elsif params[:description].present?
      results = Spell.where("description LIKE ? ", "%#{params[:description]}%").order(:name)
    elsif params[:klass].present?
      results = Spell.where("? = ANY (klass)", "#{params[:klass]}").order(:name)
    else
      results = Spell.all.order(:name)
    end
    p results.inspect
    results.each_slice(6).to_a
  end
end
