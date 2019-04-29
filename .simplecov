SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Serializers", "app/serializers"
  add_filter 'config'
  add_filter 'spec'
end
