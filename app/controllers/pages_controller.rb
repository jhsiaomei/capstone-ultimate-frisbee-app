class PagesController < ApplicationController
  def index
    @fields = []
    fields = Field.all
    fields.each do |field|
      if field.events != []
        @fields << field
      end
    end
    @fields
  end
end
