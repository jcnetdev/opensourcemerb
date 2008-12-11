class Hash
  def to_hash
    return self
  end
end

class Object  
  def present?
    !blank?
  end
end

class Array
  # rails does some things right
  def extract_options!
    last.is_a?(::Hash) ? pop : {}
  end
  
  # helps with will_paginate
  alias :total_entries :size
end

class NilClass
  def <=>(other)
    return 0
  end
  
  def to_hash
    return {}
  end
end

# allow easier checking of new vs existing
module DataMapper::Resource
  def existing_record?
    !new_record?
  end
end