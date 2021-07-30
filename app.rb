require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

# URL      GET   /projects          READ    get list of projects
# URL      GET   /projects/:id      READ    look at a single project
# URL      GET   /projects/new      READ    go to the form page for adding a new porject to the list
# Form     POST  /projects/:id      CREATE  add new project to projects
# URL      GET   /projects/:id/edit READ    go to form page for editing project
# Form     PATCH /projects/:id      UPDATE  update project
# Form     DEl   /projects/:id      DELETE  delete project from the list

get('/') do
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post ('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save()
  redirect to('/projects')
end

get ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end


get ('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  redirect to('/projects')
end

delete ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/projects')
end

# get ('/projects/:id/volunteers/:volunteer_id') do
#   @volunteer = Volunteer.find(params[:volunteer_id].to_i())
#   erb(:volunteer)
# end

post ('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end

# patch ('/albums/:id/songs/:song_id') do
#   @album = Album.find(params[:id].to_i())
#   song = Song.find(params[:song_id].to_i())
#   song.update(params[:name], @album.id)
#   erb(:album)
# end

# delete ('/albums/:id/songs/:song_id') do
#   song = Song.find(params[:song_id].to_i())
#   song.delete
#   @album = Album.find(params[:id].to_i())
#   erb(:album)
# end