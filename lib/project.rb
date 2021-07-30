class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id) 
  end

  def ==(project)
    self.class.eql?(project.class) & self.title.eql?(project.title)
  end

end