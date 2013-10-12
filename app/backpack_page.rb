class BackpackPage < NanoStore::Model
  PROPERTIES = [:title, :scope, :id]

  PROPERTIES.each do |prop|
    attribute prop
  end

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value) if PROPERTIES.member? key
    end
  end

  def to_s
    "<BackpackPage: id:#{id}, title:#{title}, scope:#{scope}>"
  end

end
