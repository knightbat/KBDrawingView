Pod::Spec.new do |s|
  s.name         = "KBDrawingView"
  s.version      = "1.0.2"
  s.summary      = "A Simple Drawing view in objC."
  s.platform     = :ios, "8.0"
  s.homepage     = "https://github.com/knightbat/KBDrawingView"
  s.license      = "MIT"
  s.author       = { "Jayakrishnan M" => "javajk2537@gmail.com" }
  s.source       = { :git => "https://github.com/knightbat/KBDrawingView.git", :tag => "#{s.version}" }
  s.source_files = "KBDrawingView", "KBDrawingView/*.{h,m}"
end
