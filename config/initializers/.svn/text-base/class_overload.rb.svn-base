class Object
  def try(method)
    send method if respond_to? method
  end
end

class String
  def to_alphanum(allow_spaces = false)
    return allow_spaces ? self.gsub(/[^a-zA-Z0-9\ ]/, '') : self.gsub(/[^a-zA-Z0-9]/, '')
  end
end
