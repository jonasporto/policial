module Policial
  # Public: Load and parse config files from GitHub repo.
  class RepoConfig
    def initialize(commit, options = {})
      @commit = commit
      @options = options
    end

    def for(style_guide)
      config_file = style_guide.config_file(@options)

      if config_file
        load_file(config_file)
      else
        {}
      end
    end

    def raw(style_guide, default = '')
      config_file = style_guide.config_file(@options)

      if config_file
        @commit.file_content(config_file) || default
      else
        default
      end
    end

    private

    def load_file(file)
      config_file_content = @commit.file_content(file)

      parse_yaml(config_file_content) || {}
    end

    def parse_yaml(content)
      YAML.load(content)
    rescue Psych::SyntaxError
      {}
    end
  end
end
