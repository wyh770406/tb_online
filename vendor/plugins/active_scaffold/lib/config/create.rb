module ActiveScaffold::Config
  class Create < Form
    self.crud_type = :create
    def initialize(*args)
      super
      self.persistent = self.class.persistent
    end

    # global level configuration
    # --------------------------
    # the ActionLink for this action
    def self.link
      @@link
    end
    def self.link=(val)
      @@link = val
    end
    @@link = ActiveScaffold::DataStructures::ActionLink.new('new', :label => 'Create New', :type => :table, :security_method => :create_authorized?)

    # whether the form stays open after a create or not
    cattr_accessor :persistent
    @@persistent = false

    # instance-level configuration
    # ----------------------------
    # the label= method already exists in the Form base class
    def label
      @label ? as_(@label) : as_('Create %s', @core.label.singularize)
    end

    # whether the form stays open after a create or not
    attr_accessor :persistent
  end
end
