# frozen_string_literal: true

require "erb"
require "fileutils"

module ActiveBrainz
  module Statements
    class Table < Base
      attr_reader :table_name,
                  :name,
                  :namespace,
                  :primary_key,
                  :references,
                  :attributes

      TEMPLATES = {
        model: File.read(ActiveBrainz.root.join("lib/active_brainz/models/model.rb.erb")),
        spec: File.read(ActiveBrainz.root.join("spec/active_brainz/models/model_spec.rb.erb")),
        factory: File.read(ActiveBrainz.root.join("spec/factories/models/model.rb.erb")),
      }.freeze

      def initialize(name, info, block, enabled)
        super

        @table_name = name

        if /^l_/.match?(name)
          # l_area_area => l/area_area
          @namespace = "links"
          @name = name.delete_prefix("l_")
        else
          # artist_alias_type => artist/artist_alias_type
          @namespace = name.split("_").first
        end

        # Primary key is either defined (primary_key: ...) or serial (id: :serial)
        @primary_key = info[:primary_key] || (info[:id] ? "id" : nil)
        @references = []
        @attributes = []
      end

      def render!
        return unless enabled

        # Render model
        render(TEMPLATES[:model], ActiveBrainz.root.join("lib/active_brainz/models", namespace), "#{name}.rb")

        # Render spec
        render(TEMPLATES[:spec], ActiveBrainz.root.join("spec/active_brainz/models/", namespace), "#{name}_spec.rb")

        # Render factory
        render(TEMPLATES[:factory], ActiveBrainz.root.join("spec/factories/models/", namespace), "#{name}.rb")
      end

      def attribute(name, **options)
        attributes << Attribute.new(name, __callee__, options)
      end

      # Integers are used as foreign keys
      def integer(name, **options)
        reference = references.find { |ref| ref.column == name }

        # Set nullability on reference
        return reference.null = options.fetch(:null, true) if reference

        attributes << Attribute.new(name, :integer, options)
      end

      alias uuid attribute
      alias string attribute
      alias text attribute
      alias date attribute
      alias datetime attribute
      alias time attribute
      alias boolean attribute
      alias jsonb attribute
      alias interval attribute
      alias column attribute
      alias enum attribute
      alias point attribute

      def index(_, **_); end

      def check_constraint(_, **_); end

      private

      def render(template, path, file)
        return if File.exist?(File.join(path, file))

        FileUtils.mkdir_p path unless Dir.exist?(path)

        output = ERB.new(template, trim_mode: "-").result(TableBinding.new(self).render_binding)
        File.write File.join(path, file), output
      end
    end
  end
end
