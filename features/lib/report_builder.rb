module ReportBuilder
  def self.configure
    defaults = builder.default_options
    yield defaults if block_given?
    builder.options = defaults.marshal_dump
  end

  def self.build_report(options = nil)
    builder.build_report(options)
  end

  def self.builder
    @builder ||= Builder.new
  end
end
