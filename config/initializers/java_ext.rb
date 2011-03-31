require 'java'
class java::util::Date
  def to_date
    to_time.to_date
  end

  def to_time
    Time.at(time / 1000)
  end

  def self.from_date(datetime)
    java.util.Date.new(datetime.to_time.to_i * 1000)
  end
end

class java::sql::Timestamp
  def to_time
    Time.at(time, nanos / 1000)
  end
end
