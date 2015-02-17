class EnumeratedGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions class_path, "#{class_name}"

      m.directory File.join('app/models', class_path)

      m.template 'enumerated.rb', File.join('app/models', class_path, "#{file_name}.rb")
    end
  end
end
