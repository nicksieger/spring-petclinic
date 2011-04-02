module ApplicationHelper
  def error_for(object, field)
    error_tag object.errors[field]
  end

  def error_tag(content)
    content_tag 'span', :class => 'errors' do
      content
    end
  end

  # This little wrapper around #form_for is so that we can make
  # consistent form element IDs between the Spring and the Rails
  # version of the app so that Cucumber/Capybara/Celerity tests can
  # remain the same.
  class FormIdWrapper
    def initialize(form)
      @form = form
    end

    def respond_to?(*args)
      @form.respond_to?(*args)
    end

    def method_missing(meth,*args,&block)
      if Symbol === args.first
        options = args.extract_options!
        options[:id] ||= args.first
        args << options
        @form.send(meth, *args, &block)
      else
        @form.send(meth, *args, &block)
      end
    end
  end

  def form_for(*args,&block)
    super(*args, &Proc.new do |f|
            block.call FormIdWrapper.new(f)
          end)
  end
end
