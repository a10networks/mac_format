class MacFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value = format_value!(record, attribute, value)
  rescue ArgumentError
    record.errors[attribute] << (options[:message] || "is invalid")
  end

  private

    def format_value!(record, attribute, value)
      record.send("#{ attribute }=", (value || '').to_mac)
    end
end
