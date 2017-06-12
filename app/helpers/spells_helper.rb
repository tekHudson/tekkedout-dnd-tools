module SpellsHelper
  def page_title(params)
    return "#{params[:klass]} Spells" if params[:klass].present?
    "Spells"
  end
end
