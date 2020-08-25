class InnocenceValidator < ActiveModel::Validator
  def validate(record)
    if record.description
      if record.description.match?('devil')
        record.errors[:description] << "is too devilish."
      end
    end
  end
end
