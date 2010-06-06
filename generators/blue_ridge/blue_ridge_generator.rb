require File.expand_path(File.dirname(__FILE__) + '/../../lib/blue_ridge')

class BlueRidgeGenerator < Rails::Generator::Base
  def execute
      base_dir = BlueRidge.javascript_spec_dir
      
      directory base_dir
      create_file 'application_spec.js', "#{base_dir}/application_spec.js"
      create_file 'spec_helper.js',      "#{base_dir}/spec_helper.js"
      
      directory "#{base_dir}/fixtures"
      create_file 'application.html', "#{base_dir}/fixtures/application.html"
      create_file 'screw.css',        "#{base_dir}/fixtures/screw.css"
    end
  end
end
