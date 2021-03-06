require "spec_helper"

describe Volunteer do
  describe '#name' do
    it 'returns the name of the volunteer' do
      test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil}) # changed project_id
      expect(test_volunteer.name).to eq 'Jane'
    end
  end

#   describe '#project_id' do
#     it 'returns the project_id of the volunteer' do
#       test_volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
#       expect(test_volunteer.project_id).to eq 1
#     end
#   end

#   describe '#==' do
#     it 'checks for equality based on the name of a volunteer' do
#       volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
#       volunteer2 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
#       expect(volunteer1 == volunteer2).to eq true
#     end
#   end

#   context '.all' do
#     it 'is empty to start' do
#       expect(Volunteer.all).to eq []
#     end

#     it 'returns all volunteers' do
#       volunteer1 = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
#       volunteer1.save
#       volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
#       volunteer2.save
#       expect(Volunteer.all).to eq [volunteer1, volunteer2]
#     end
#   end

#   describe '#save' do
#     it 'adds a volunteer to the database' do
#       volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
#       volunteer.save
#       expect(Volunteer.all).to eq [volunteer]
#     end
#   end

#   describe '.find' do
#     it 'returns a volunteer by id' do
#       volunteer = Volunteer.new({:name => 'Jane', :project_id => 1, :id => nil})
#       volunteer.save
#       volunteer2 = Volunteer.new({:name => 'Joe', :project_id => 1, :id => nil})
#       volunteer2.save
#       expect(Volunteer.find(volunteer.id)).to eq volunteer
#     end
#   end

#   describe '.find_by_project' do
#     it 'finds volunteers for an project' do
#       project2 = Project.new({:title => "Blue", :id => nil})
#       project2.save
#       binding.pry
#       volunteer = Volunteer.new({:name => "Naima", :project_id => 1, :id => nil})
#       volunteer.save()
#       volunteer2 = Volunteer.new({:name => "Rain", :project_id => 1, :id => nil})
#       volunteer2.save()
#       expect(Volunteer.find_by_project(project2.id)).to(eq([volunteer2]))
#     end
#   end
# end

# describe('.find_by_album') do
#   it("finds songs for an album") do
#     album2 = Album.new({:name => "Blue", :id => nil})
#     album2.save
#     song = Song.new({:name => "Naima", :album_id => @album.id, :id => nil})
#     song.save()
#     song2 = Song.new({:name => "California", :album_id => album2.id , :id => nil})
#     song2.save()
#     expect(Song.find_by_album(album2.id)).to(eq([song2]))
#   end
end
