class HomeScreen < PM::Screen
  include HomeStyles

  title "Home"

  def on_load
    button_view = UIView.alloc.initWithFrame CGRectMake(0,0,30,30)
    button_view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed("go_back-icon.gif"))
    nav_button = UIBarButtonItem.alloc.initWithCustomView(button_view)

    set_nav_bar_button :left, action: :closing, button: nav_button
    set_nav_bar_button :right, title: "States", action: :states_tapped
  end

  def closing
    PM.logger.debug "Closing!"
  end

  def on_presented
    @view_setup ||= self.set_up_view
  end

  def set_up_view
    set_attributes self.view, {
      background_color: UIColor.grayColor
    }

    add UILabel.new, label_view # found in HomeStyles module

    true
  end

  def states_tapped
    open StatesScreen
  end

  def help_tapped
    open_modal HelpScreen.new(nav_bar: true)
  end
end
