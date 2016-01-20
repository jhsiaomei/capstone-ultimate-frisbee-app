class Api::V1::FieldsController < ApplicationController
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
