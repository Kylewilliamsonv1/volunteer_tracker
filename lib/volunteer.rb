class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name) 
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  # def ==(volunteer_to_compare)
  #   self.name() == volunteer_to_compare.name() 
  # end

  def ==(volunteer_to_compare)
    if volunteer_to_compare != nil
      (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id()) 
    else
      false
    end
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => id, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    name = volunteer.fetch("name")
    id = volunteer.fetch("id").to_i
    Volunteer.new({:name => name, :project_id => id, :id => id})
  end

  # def self.find_by_project(prj_id)
  #   volunteers = []
  #   returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{prj_id};")
  #   returned_volunteers.each() do |volunteer|
  #     name = volunteer.fetch("name")
  #     id = volunteer.fetch("id").to_i
  #     volunteers.push(Volunteer.new({:name => name, :project_id => prj_id, :id => id}))
  #   end
  #   volunteers
  # end
end

# def self.find_by_album(alb_id)
#   songs = []
#   returned_songs = DB.exec("SELECT * FROM songs WHERE album_id = #{alb_id};")
#   returned_songs.each() do |song|
#     name = song.fetch("name")
#     id = song.fetch("id").to_i
#     songs.push(Song.new({:name => name, :album_id => alb_id, :id => id}))
#   end
#   songs
# end
