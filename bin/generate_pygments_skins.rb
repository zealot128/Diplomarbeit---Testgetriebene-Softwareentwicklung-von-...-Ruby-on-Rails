
styles = ["monokai", "manni", "perldoc", "borland", "colorful", "default", "murphy", "vs", "trac", "tango", "fruity", "autumn", "bw", "emacs", "pastie", "friendly", "native"]

styles = ["solarized"]

styles.each do |style|
  cmd = "pygmentize -O full,style=#{style} -f latex listings/steps.rb"
  text = `#{cmd}`
  src = text.match(/(\\makeatletter.*\\makeatother)/m)
  File.open("styles/py_#{style}.tex", "w+") {|f| f.write src[1] + "\n"}
end
