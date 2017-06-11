class SpellsController < ApplicationController
  def index
    @spells = Spell.all_for_display(params)
  end
end
