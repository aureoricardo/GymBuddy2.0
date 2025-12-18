module ApplicationHelper
    # Matches exact path or partial patterns (e.g. '/messages', '/profile')
    def matches_path(*paths)
      paths.any? do |path|
        case path
        when String
          request.path == path || request.path.start_with?(path)
        when Regexp
          request.path.match?(path)
        else
          false
        end
      end
    end
  end
  