# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Player::Application.initialize!

# Limpiamos todas las inflecciones existentes
ActiveSupport::Inflector.inflections.clear

# Agregamos las reglas de inflección
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'jugador', 'jugador'
end