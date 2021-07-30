class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name) 
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(volunteer_to_compare)
    self.name() == volunteer_to_compare.name()
  end

  # def self.all
  #   returned_volunteers = DB.exec("SELECT * FROM volunteers;")
  #   volunteers = []
  #   returned_volunteers.each() do |volunteer|
  #     name = volunteers.fetch("name")
  #     id = volunteers.fetch("id").to_i
  #     volunteers.push(Album.new({:name => name, :id => id}))
  #   end
  #   volunteers
  # end

  # def save
  #   result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
  #   @id = result.first().fetch("id").to_i
  # end  
end

