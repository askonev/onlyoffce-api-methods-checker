# frozen_string_literal: true

# module
module Parse
  def boundary_index(str)
    http_methods = %w[post put delete get]

    http_methods.each do |method|
      return str.index(method) if str.index(method)
    end
  end

  def parsing(elements)
    index = boundary_index(elements[0].attribute("href"))
    elements = elements.map { |x| x.attribute("href").slice(index..) }
    elements.map do |x|
      x = x.split('/')
      http_method = x.shift.upcase
      result = x.unshift(http_method)
      result.join('/')
    end
  end
end
