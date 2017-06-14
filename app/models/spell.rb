class Spell < ApplicationRecord
  def self.all_for_display (params)
    if params[:name].present? || params[:description].present? || params[:klass].present?
      if params[:klass].present?
        results = Spell.where("? = ANY (klass)", "#{params[:klass]}")
      end

      if params[:name].present?
        if results.present?
          results = results.where("lower(name) LIKE ? ", "%#{params[:name]}%".downcase)
        else
          results = Spell.where("lower(name) LIKE ? ", "%#{params[:name]}%".downcase)
        end
      end

      if params[:description].present?
        if results.present?
          results = results.where("lower(description) LIKE ? ", "%#{params[:description]}%".downcase)
        else
          results = Spell.where("lower(description) LIKE ? ", "%#{params[:description]}%".downcase) if params[:description].present?
        end
      end
    else
      results = Spell.all
    end

    results.order(:name).each_slice(6).to_a
  end
end
