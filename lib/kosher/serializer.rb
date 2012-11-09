module Serializer
  extend self

  def to_hash(obj)
    case obj
    when Virtus
      Hash[obj.to_hash.map { |k, v| [k, to_hash(v)] }]
    when Array
      obj.map { |v| to_hash(v) }
    else
      obj
    end
  end
end
