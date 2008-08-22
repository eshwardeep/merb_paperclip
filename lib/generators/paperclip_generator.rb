module Merb::Generators

  class PaperclipGenerator < NamespacedGenerator
    
    def self.source_root
      File.dirname(__FILE__) / 'templates'
    end
    
    desc <<-DESC
      Generators a paperclip migration
    DESC
    
    first_argument  :name, :required => true, :desc => "model name"
    second_argument :attachments, :required => true, :as => :array, :default => [], :desc => "space separated list of fields"

    template :paperclip do
      source(File.dirname(__FILE__) / 'templates' / '%file_name%.rb')
      destination("schema/migrations/#{migration_name}.rb")
    end
    
    def version
      format("%03d", current_migration_nr + 1)
    end
    
    def migration_name
      names = attachments.map{|a| a.underscore }
      names = names[0..-2] + ["and", names[-1]] if names.length > 1
      "#{version}_add_attachments_#{names.join("_")}_to_#{class_name.underscore}"
    end      

    protected

    def destination_directory
      File.join(destination_root, 'schema', 'migrations')
    end

    def current_migration_nr
      Dir["#{destination_directory}/*"].map{|f| File.basename(f).match(/^(\d+)/)[0].to_i  }.max.to_i
    end
    
  end

  add :paperclip, PaperclipGenerator
end