java_import org.springframework.samples.petclinic.Visit

class Visit
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  def date
    getDate.to_date
  end
end
