class JavascriptSpecGenerator < Rails::Generator::NamedBase
  def manifest
    file_path_with_spec, file_path_without_spec = file_path_with_and_without_spec
    
    record do |m|
      base_dir = BlueRidge.javascript_spec_dir
      
      m.directory base_dir
      m.directory "#{base_dir}/fixtures"
      
      options = {:class_name_without_spec => class_name_without_spec, :file_path_without_spec => file_path_without_spec}
      m.template 'javascript_spec.js.erb', "#{base_dir}/#{file_path_with_spec}.js", :assigns => options
      m.template 'fixture.html.erb', "#{base_dir}/fixtures/#{file_path_without_spec}.html", :assigns => options
    end
  end

  def file_path_with_and_without_spec
    if (file_path =~ /_spec$/i)
      [file_path, file_path.gsub(/_spec$/, "")]
    else
      [file_path + "_spec", file_path]
    end
  end
  
  def class_name_without_spec
    (class_name =~ /Spec$/) ? class_name.gsub(/Spec$/, "") : class_name
  end
  
  def self.gem_root
    File.expand_path('../../../', __FILE__)
  end

  def self.source_root
    File.join(gem_root, 'templates', 'javascript_spec')
  end
  
end
