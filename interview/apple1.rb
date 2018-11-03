class Path
  attr_accessor :current_path

  def initialize(path)
    @current_path = path
  end

  def cd(path)
    dirs = path.split('/')
    if dirs[0] == '..'
      dirs.each do |dir|
        case dir
        when '..'
          @current_path.chomp(dir)
        else
          @current_path = @current_path + '/' + dir
        end
      end
    else
      @current_path = path
    end
    @current_path
  end
end

path = Path.new('/a/b/c/d')

path.cd('../x')

puts path.current_path
