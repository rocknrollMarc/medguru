class TextPart < Part

  def body
    data[:body]
  end

  def body=body
    data[:body]=body
  end

  def as_json(options={})
    {
       id: id,
       data: data,
       type: type
     }
  end
end
